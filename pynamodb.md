### Key Points
- PynamoDB is a Python library for Amazon DynamoDB, offering a simple API with full feature support, requiring Python 3.6+.
- It includes installation via pip (`pip install pynamodb`) or conda, and needs an AWS account with configured credentials.
- Models are defined by subclassing `pynamodb.models.Model`, with examples for creating, querying, and managing data.
- It supports advanced features like indexes, conditional operations, transactions, and batch operations, with detailed examples provided.

### Installation and Setup
To start using PynamoDB, install it using:
- Pip: `$ pip install pynamodb`
- Conda: `$ conda install -c conda-forge pynamodb`

Ensure you have an AWS account ([AWS Website](https://aws.amazon.com/)) and configure AWS credentials via Boto3 ([Boto Documentation](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/configuration.html)).

### Defining and Using Models
Define models by inheriting from `pynamodb.models.Model`, specifying attributes like `UnicodeAttribute` or `NumberAttribute`. For example:

```python
from pynamodb.models import Model
from pynamodb.attributes import UnicodeAttribute

class UserModel(Model):
    class Meta:
        table_name = 'dynamodb-user'
        region = 'us-west-1'
    email = UnicodeAttribute(hash_key=True)
    first_name = UnicodeAttribute()
```

Create tables with `create_table()`, and perform operations like `save()`, `get()`, `update()`, and `delete()`.

### Advanced Features
- **Querying**: Use `query()` with conditions, e.g., `UserModel.query('last_name', UserModel.first_name.startswith('J'))`.
- **Indexes**: Define Global Secondary Indexes (GSI) for efficient querying, e.g., with `GlobalSecondaryIndex`.
- **Conditional Operations**: Ensure operations meet conditions, like `user.save(condition=UserModel.email.exists())`.
- **Transactions**: Use `TransactWrite` for atomic operations, e.g., saving and deleting multiple items at once.

### Unexpected Detail
A notable change in version 6.0.1 is that `UnicodeAttribute` and `BinaryAttribute` now support empty values, which might affect upgrades from older versions by treating empty strings as valid instead of None.

---

### PynamoDB Comprehensive Documentation

This comprehensive guide provides an exhaustive overview of PynamoDB, a Pythonic interface to Amazon's DynamoDB, ensuring users can understand and utilize it effectively. It covers installation, model definition, operations, advanced features, and best practices, drawing from official documentation and resources, with all examples included for clarity.

#### Introduction and Background

PynamoDB is designed to simplify interactions with Amazon DynamoDB, offering a Pythonic API that supports all DynamoDB features, including Unicode and binary attributes, sets, automatic pagination, global and local secondary indexes, and complex queries. It was developed to address limitations in other libraries like dynamodb-mapper, which lacked support for Global Secondary Indexes and Python 3 compatibility at the time of its creation. The library requires Python 3.6 or greater, a change introduced in version 6.0.1, dropping support for Python 2.

#### Installation and Prerequisites

To install PynamoDB, users can use pip with the command `$ pip install pynamodb` or conda with `$ conda install -c conda-forge pynamodb`. Installation instructions for pip are available at [Pip Installation Guide](https://pip.pypa.io/en/latest/installing/). Before usage, an Amazon Web Services account is required, accessible at [AWS Website](https://aws.amazon.com/), and AWS credentials must be configured via Boto3, with guidance at [Boto Documentation](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/configuration.html).

#### Defining and Using Models

Models are the core of PynamoDB, defined by inheriting from `pynamodb.models.Model`. Attributes are specified using classes like `UnicodeAttribute`, `NumberAttribute`, `UnicodeSetAttribute`, and `UTCDateTimeAttribute`. An example from the Basic Tutorial illustrates:

```python
from pynamodb.models import Model
from pynamodb.attributes import UnicodeAttribute, NumberAttribute

class Thread(Model):
    class Meta:
        table_name = 'Thread'
        region = 'us-west-1'
    forum_name = UnicodeAttribute(hash_key=True)
    subject = UnicodeAttribute(range_key=True)
    views = NumberAttribute(default=0)
```

The `Meta` class requires `table_name`, with optional settings like `region`, `host`, `read_capacity_units`, and `write_capacity_units`. Tables must exist; create them with `Thread.create_table(read_capacity_units=1, write_capacity_units=1, wait=True)` or face a `TableDoesNotExist` exception. Deletion is handled by `Thread.delete_table()`.

#### Attribute Configuration

Attributes can be configured with `null=True` for nullable fields, `default` for initial values (static or callable), and `attr_name` for custom DynamoDB names, e.g., `thread_name = UnicodeAttribute(null=True, attr_name='tn')`. By default, attributes cannot be null, and PynamoDB prunes null values during serialization to save space, as DynamoDB pricing is based on reads/writes per KB. Hash and range keys must always have values.

Examples:

| Attribute Type            | Example Code                                                                                     |
|---------------------------|-------------------------------------------------------------------------------------------------|
| Default Value             | ```python<br>forum_name = UnicodeAttribute(hash_key=True, default='My Default Value')<br>```     |
| Default Callable          | ```python<br>def my_default_value(): return 'My default value'<br>forum_name = UnicodeAttribute(hash_key=True, default=my_default_value)<br>``` |
| Nullable Attribute        | ```python<br>my_nullable_attribute = UnicodeAttribute(null=True)<br>```                          |
| Custom Attribute Name     | ```python<br>thread_name = UnicodeAttribute(null=True, attr_name='tn')<br>```                    |

#### Basic Operations

Operations include creating, reading, updating, and deleting items. Create an item with `thread_item = Thread('forum_name', 'forum_subject', replies=10); thread_item.save()`. Retrieve with `Thread.get('forum_name', 'forum_subject')`, which raises `DoesNotExist` if not found. Update with `refresh()` or atomic updates via `update()`, e.g., `update(actions=[Thread.views.set(Thread.views + 1)])`. Note: `update_item` is deprecated since version 2.0, replaced by `update()`. Delete with `thread_item.delete()`.

Examples:

| Operation        | Code Example                                                                                     |
|------------------|-------------------------------------------------------------------------------------------------|
| Create Item      | ```python<br>thread_item = Thread('forum_name', 'forum_subject', replies=10)<br>thread_item.save()<br>``` |
| Retrieve Item    | ```python<br>thread_item = Thread.get('forum_name', 'forum_subject')<br>```                      |
| Update Item      | ```python<br>thread_item.update(actions=[Thread.views.set(Thread.views + 1)])<br>```             |
| Delete Item      | ```python<br>thread_item.delete()<br>```                                                         |

#### Querying and Counting

PynamoDB provides an intuitive abstraction over DynamoDB's Query API, supporting all comparison operators. Example: `for thread in Thread.query('forum_name', Thread.subject.startswith('Subject')): print(thread.subject)`. Counting items uses `count()`, e.g., `Thread.count('forum_name', Thread.subject.startswith('J'))`, but raises `ValueError` if used with filters and `hash_key=None`, a change noted in release 6.0.2 for returning correct results.

Examples:

| Query Type       | Code Example                                                                                     |
|------------------|-------------------------------------------------------------------------------------------------|
| Simple Query     | ```python<br>for thread in Thread.query('forum_name', Thread.subject.startswith('Subject')): print(thread.subject)<br>``` |
| Count Query      | ```python<br>count = Thread.count('forum_name', Thread.subject.startswith('J'))<br>print(count)<br>``` |

#### Batch Operations

Batch operations are limited to 25 items per `BatchWriteItem` call, combining PutRequests and DeleteRequests. Example: Batch write 100 users with `batch_write()`, retrieve with `batch_get(user_keys)`, and delete with `batch.delete(item)`. This is efficient for reducing API calls, as seen in the Usage examples.

Examples:

| Batch Operation  | Code Example                                                                                     |
|------------------|-------------------------------------------------------------------------------------------------|
| Batch Write      | ```python<br>with UserModel.batch_write() as batch:<br>    for i in range(100):<br>        user = UserModel(f'user{i}@example.com', first_name=f'User{i}', last_name='Batch')<br>        batch.save(user)<br>``` |
| Batch Get        | ```python<br>keys = [('user1@example.com',), ('user2@example.com',)]<br>for user in UserModel.batch_get(keys):<br>    print(user.first_name)<br>``` |

#### Indexes: Global and Local Secondary Indexes

PynamoDB supports both Global Secondary Indexes (GSI) and Local Secondary Indexes (LSI). Define them in the model, e.g.:

```python
from pynamodb.indexes import GlobalSecondaryIndex, AllProjection

class ViewIndex(GlobalSecondaryIndex):
    class Meta:
        read_capacity_units = 2
        write_capacity_units = 1
        projection = AllProjection()
    view = NumberAttribute(default=0, hash_key=True)

class TestModel(Model):
    class Meta:
        table_name = "TestModel"
    forum = UnicodeAttribute(hash_key=True)
    thread = UnicodeAttribute(range_key=True)
    view = NumberAttribute(default=0)
    view_index = ViewIndex()
```

Query using the index with `TestModel.view_index.query('gsi_value')`. This enhances query performance, especially for non-key attributes.

#### Conditional Operations

Conditional operations ensure operations occur only if conditions are met, applicable to save, update, delete, query, and scan. Conditions use operators like `==`, `!=`, `<`, `>`, and methods like `exists()`, `does_not_exist()`, `startswith()`, `contains()`.

Example table of conditions:

| DynamoDB Condition | PynamoDB Syntax          | Attribute Types | Example                          |
|--------------------|--------------------------|-----------------|-----------------------------------|
| =                  | ==                       | Any             | `Thread.forum_name == 'Some Forum'` |
| <>                 | !=                       | Any             | `Thread.forum_name != 'Some Forum'` |
| <                  | <                        | Binary, Number, String | `Thread.views < 10` |
| <=                 | <=                       | Binary, Number, String | `Thread.views <= 10` |
| >                  | >                        | Binary, Number, String | `Thread.views > 10` |
| >=                 | >=                       | Binary, Number, String | `Thread.views >= 10` |
| BETWEEN            | between(lower, upper)    | Binary, Number, String | `Thread.views.between(1, 5)` |
| IN                 | is_in(*values)           | Binary, Number, String | `Thread.subject.is_in('Subject', 'Other Subject')` |
| attribute_exists   | exists()                 | Any             | `Thread.forum_name.exists()` |
| attribute_not_exists | does_not_exist()      | Any             | `Thread.forum_name.does_not_exist()` |
| attribute_type     | is_type()                | Any             | `Thread.forum_name.is_type()` |
| begins_with        | startswith(prefix)       | String          | `Thread.subject.startswith('Example')` |
| contains           | contains(item)           | Set, String     | `Thread.subject.contains('foobar')` |
| size               | size(attribute)          | Binary, List, Map, Set, String | `size(Thread.subject) == 10` |
| AND                | &                        | Any             | `(Thread.views > 1) & (Thread.views < 5)` |
| OR                 | |                        | Any             | `(Thread.views < 1) | (Thread.views > 5)` |
| NOT                | ~                        | Any             | `~Thread.subject.contains('foobar')` |

Nested conditions use Python's item operator `[]`, e.g., `Thread.properties['emoji'].exists()`. Composition uses `&` (AND) and `|` (OR), with `None` for chaining, e.g., `condition = None; if request.subject: condition &= Thread.subject.contains(request.subject)`.

#### Transactions and Pagination

Transactions are handled by `TransactGet`, `TransactWrite`, and `Transaction` classes, ensuring atomic operations. Example:

```python
with TransactWrite() as transaction:
    transaction.save(UserModel('user1'))
    transaction.delete(UserModel('user2'))
```

Pagination is managed by `PageIterator`, with automatic handling for large result sets, and `RateLimiter` for rate limiting, referencing [Query Pagination](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Query.Pagination.html) and [Scan Pagination](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Scan.html#Scan.Pagination).

#### Using DynamoDB Local for Testing

For cost-free testing, configure PynamoDB to use DynamoDB Local by setting `host = "http://localhost:8000"` in the Meta class. Examples are available in the GitHub repository at [PynamoDB Examples](https://github.com/pynamodb/PynamoDB/tree/master/examples), configured for localhost, with instructions at [Use PynamoDB Locally](https://pynamodb.readthedocs.io/en/latest/local.html#local).

#### Best Practices and Considerations

Best practices include using `update()` for atomic updates to avoid race conditions, being mindful of DynamoDB's 400KB item size limit, and optimizing read/write capacity units. Batch operations reduce API calls, and conditional operations ensure data consistency. Note the change in version 6.0.1: `UnicodeAttribute` and `BinaryAttribute` now support empty values, potentially breaking code expecting None for empty strings, and `UTCDateTimeAttribute` requires strict date format '%Y-%m-%dT%H:%M:%S.%f%z' for ordering.

#### Release Notes and Upgrades

Version 6.0.2, released recently, fixes a deprecation warning for `datetime.datetime.utcfromtimestamp()`, a minor update. Version 6.0.1 introduced breaking changes, including Python 3.6+ requirement and empty value support, detailed at [Release Notes 6.0.2](https://pynamodb.readthedocs.io/en/latest/release_notes.html). Users upgrading should check [Upgrading Guide](https://pynamodb.readthedocs.io/en/stable/upgrading.html) for compatibility.

#### Additional Resources

For further exploration, refer to the [Official Documentation](https://pynamodb.readthedocs.io/), [GitHub Repository](https://github.com/pynamodb/PynamoDB), and [PyPI Page](https://pypi.org/project/pynamodb/) for installation and examples.

This comprehensive guide ensures users can leverage PynamoDB effectively, covering all aspects from setup to advanced usage, with practical examples and best practices.

### Key Citations
- [Basic Tutorial PynamoDB 6.0.2 Documentation](https://pynamodb.readthedocs.io/en/latest/tutorial.html)
- [API PynamoDB 6.0.2 Documentation](https://pynamodb.readthedocs.io/en/latest/api.html)
- [Usage PynamoDB 6.0.2 Documentation](https://pynamodb.readthedocs.io/en/latest/quickstart.html)
- [Conditional Operations PynamoDB 6.0.2 Documentation](https://pynamodb.readthedocs.io/en/latest/conditional.html)
- [PynamoDB Examples 6.0.2 Documentation](https://pynamodb.readthedocs.io/en/latest/examples.html)
- [Release Notes PynamoDB 6.0.2 Documentation](https://pynamodb.readthedocs.io/en/latest/release_notes.html)
- [AWS Website for Account Setup](https://aws.amazon.com/)
- [Boto Documentation for Configuration](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/configuration.html)
- [Pip Installation Guide for Instructions](https://pip.pypa.io/en/latest/installing/)
- [Query Pagination AWS Documentation](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Query.Pagination.html)
- [Scan Pagination AWS Documentation](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Scan.html#Scan.Pagination)
- [PynamoDB GitHub Repository for Examples](https://github.com/pynamodb/PynamoDB/tree/master/examples)
- [Use PynamoDB Locally Documentation](https://pynamodb.readthedocs.io/en/latest/local.html#local)
- [Upgrading Guide PynamoDB 6.0.1 Documentation](https://pynamodb.readthedocs.io/en/stable/upgrading.html)
- [PyPI Page for pynamodb](https://pypi.org/project/pynamodb/)
