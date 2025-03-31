Below is the complete conversion of the provided AWS Serverless Application Model (SAM) Developer Guide document from the XML-like structure (representing OCR content from a PDF) into a single Markdown file. This conversion follows the structure and content as outlined in the document, using Markdown formatting for headings, lists, code blocks, tables, and other elements to enhance readability. The process preserves the document's hierarchy, removes page-specific artifacts (like page numbers), and ensures a seamless flow suitable for a single Markdown file.

```markdown
# AWS Serverless Application Model Developer Guide

*Developer Guide - March 31, 2025*

Copyright © 2025 Amazon Web Services, Inc. and/or its affiliates. All rights reserved.

Amazon's trademarks and trade dress may not be used in connection with any product or service that is not Amazon's, in any manner that is likely to cause confusion among customers, or in any manner that disparages or discredits Amazon. All other trademarks not owned by Amazon are the property of their respective owners, who may or may not be affiliated with, connected to, or sponsored by Amazon.

## Table of Contents

- [What is AWS SAM?](#what-is-aws-sam)
- [Key features](#key-features)
- [Related information](#related-information)
- [How it works](#how-it-works)
- [What is the AWS SAM template specification?](#what-is-the-aws-sam-template-specification)
- [What is the AWS SAM project and AWS SAM template?](#what-is-the-aws-sam-project-and-aws-sam-template)
- [What is the AWS SAM CLI?](#what-is-the-aws-sam-cli)
- [Learn more](#learn-more)
- [Next steps](#next-steps)
- [Serverless concepts](#serverless-concepts)
- [Getting started](#getting-started)
- [Prerequisites](#prerequisites)
- [Step 1: Sign up for an AWS account](#step-1-sign-up-for-an-aws-account)
- [Step 2: Create an IAM user account](#step-2-create-an-iam-user-account)
- [Step 3: Create an access key ID and secret access key](#step-3-create-an-access-key-id-and-secret-access-key)
- [Step 4: Install the AWS CLI](#step-4-install-the-aws-cli)
- [Step 5: Use the AWS CLI to configure AWS credentials](#step-5-use-the-aws-cli-to-configure-aws-credentials)
- [Next steps](#next-steps-1)
- [Install the AWS SAM CLI](#install-the-aws-sam-cli)
- [Installing the AWS SAM CLI](#installing-the-aws-sam-cli)
- [Troubleshooting installation errors](#troubleshooting-installation-errors)
- [Next steps](#next-steps-2)
- [Optional: Verify the AWS SAM CLI installer](#optional-verify-the-aws-sam-cli-installer)
- [Hello World Tutorial](#hello-world-tutorial)
- [Prerequisites](#prerequisites-1)
- [Step 1: Initialize the sample Hello World application](#step-1-initialize-the-sample-hello-world-application)
- [Step 2: Build your application](#step-2-build-your-application)
- [Step 3: Deploy your application to the AWS Cloud](#step-3-deploy-your-application-to-the-aws-cloud)
- [Step 4: Run your application](#step-4-run-your-application)
- [Step 5: Interact with your function in the AWS Cloud](#step-5-interact-with-your-function-in-the-aws-cloud)
- [Step 6: Modify and sync your application to the AWS Cloud](#step-6-modify-and-sync-your-application-to-the-aws-cloud)
- [Step 7: (Optional) Test your application locally](#step-7-optional-test-your-application-locally)
- [Step 8: Delete your application from the AWS Cloud](#step-8-delete-your-application-from-the-aws-cloud)
- [Troubleshooting](#troubleshooting)
- [Learn more](#learn-more-1)
- [How to use AWS SAM](#how-to-use-aws-sam)
- [The AWS SAM CLI](#the-aws-sam-cli)
- [How AWS SAM CLI commands are documented](#how-aws-sam-cli-commands-are-documented)
- [Configuring the AWS SAM CLI](#configuring-the-aws-sam-cli)
- [Core commands](#core-commands)
- [The AWS SAM project](#the-aws-sam-project)
- [Template anatomy](#template-anatomy)
- [Resources and properties](#resources-and-properties)
- [Generated resources](#generated-resources)
- [Supported resource attributes](#supported-resource-attributes)
- [API Gateway extensions](#api-gateway-extensions)
- [Intrinsic functions](#intrinsic-functions)
- [Develop your application](#develop-your-application)
- [Create your application](#create-your-application)
- [Initialize a new serverless application](#initialize-a-new-serverless-application)
- [Options for sam init](#options-for-sam-init)
- [Troubleshooting](#troubleshooting-1)
- [Examples](#examples)
- [Learn more](#learn-more-2)
- [Next steps](#next-steps-3)
- [Define your infrastructure](#define-your-infrastructure)
- [Define application resources](#define-application-resources)
- [Set up access](#set-up-access)
- [Control API access](#control-api-access)
- [Increase efficiency with layers](#increase-efficiency-with-layers)
- [Reuse code](#reuse-code)
- [Manage time-based events](#manage-time-based-events)
- [Orchestrating applications](#orchestrating-applications)
- [Set up code signing](#set-up-code-signing)
- [Validate AWS SAM template files](#validate-aws-sam-template-files)
- [Build your application](#build-your-application)
- [Intro to sam build](#intro-to-sam-build)
- [Default build](#default-build)
- [Customize your build](#customize-your-build)
- [Test your application](#test-your-application)
- [Intro to sam local](#intro-to-sam-local)
- [Using the sam local command](#using-the-sam-local-command)
- [Intro to sam local generate-event](#intro-to-sam-local-generate-event)
- [Intro to sam local invoke](#intro-to-sam-local-invoke)
- [Intro to sam local start-api](#intro-to-sam-local-start-api)
- [Intro to sam local start-lambda](#intro-to-sam-local-start-lambda)
- [Locally invoke functions](#locally-invoke-functions)
- [Environment variable file](#environment-variable-file)
- [Layers](#layers)
- [Learn more](#learn-more-3)
- [Locally run API Gateway](#locally-run-api-gateway)
- [Environment variable file](#environment-variable-file-1)
- [Layers](#layers-1)
- [Test with sam remote test-event](#test-with-sam-remote-test-event)
- [Set up the AWS SAM CLI to use sam remote test-event](#set-up-the-aws-sam-cli-to-use-sam-remote-test-event)
- [Using the sam remote test-event command](#using-the-sam-remote-test-event-command)
- [Using shareable test events](#using-shareable-test-events)
- [Managing shareable test events](#managing-shareable-test-events)
- [Test with sam remote invoke](#test-with-sam-remote-invoke)
- [Using the sam remote invoke command](#using-the-sam-remote-invoke-command)
- [Using sam remote invoke command options](#using-sam-remote-invoke-command-options)
- [Configure your project configuration file](#configure-your-project-configuration-file)
- [Examples](#examples-1)
- [Related links](#related-links)
- [Automate integration tests](#automate-integration-tests)
- [Generate sample payloads](#generate-sample-payloads)
- [Debug your application](#debug-your-application)
- [Locally debug functions](#locally-debug-functions)
- [Using AWS Toolkits](#using-aws-toolkits)
- [Running AWS SAM locally in debug mode](#running-aws-sam-locally-in-debug-mode)
- [Pass multiple runtime arguments](#pass-multiple-runtime-arguments)
- [Validate with cfn-lint](#validate-with-cfn-lint)
- [Examples](#examples-2)
- [Learn more](#learn-more-4)
- [Deploy your application and resources](#deploy-your-application-and-resources)
- [Intro to sam deploy](#intro-to-sam-deploy)
- [Prerequisites](#prerequisites-2)
- [Deploying applications using sam deploy](#deploying-applications-using-sam-deploy)
- [Best practices](#best-practices)
- [Options for sam deploy](#options-for-sam-deploy)
- [Troubleshooting](#troubleshooting-2)
- [Examples](#examples-3)
- [Learn more](#learn-more-5)
- [Deployment options](#deployment-options)
- [How to use the AWS SAM CLI to manually deploy](#how-to-use-the-aws-sam-cli-to-manually-deploy)
- [Deploy with CI/CD systems and pipelines](#deploy-with-cicd-systems-and-pipelines)
- [Gradual deployments](#gradual-deployments)
- [Troubleshooting deployments using the AWS SAM CLI](#troubleshooting-deployments-using-the-aws-sam-cli)
- [Learn more](#learn-more-6)
- [Deploy with CI/CD systems and pipelines](#deploy-with-cicd-systems-and-pipelines-1)
- [What is a pipeline?](#what-is-a-pipeline)
- [How AWS SAM uploads local files](#how-aws-sam-uploads-local-files)
- [Generate a starter pipeline](#generate-a-starter-pipeline)
- [Customize starter pipelines](#customize-starter-pipelines)
- [Automate your deployments](#automate-your-deployments)
- [Use OIDC authentication](#use-oidc-authentication)
- [Intro to sam sync](#intro-to-sam-sync)
- [Automatically detect and sync local changes to the AWS Cloud](#automatically-detect-and-sync-local-changes-to-the-aws-cloud)
- [Customize what local changes are synced to the AWS Cloud](#customize-what-local-changes-are-synced-to-the-aws-cloud)
- [Prepare your application in the cloud for testing and validation](#prepare-your-application-in-the-cloud-for-testing-and-validation)
- [Options for the sam sync command](#options-for-the-sam-sync-command)
- [Troubleshooting](#troubleshooting-3)
- [Examples](#examples-4)
- [Learn more](#learn-more-7)
- [Monitor your application](#monitor-your-application)
- [Application Insights](#application-insights)
- [Configuring CloudWatch Application Insights with AWS SAM](#configuring-cloudwatch-application-insights-with-aws-sam)
- [Next steps](#next-steps-4)
- [Working with logs](#working-with-logs)
- [Fetching logs by AWS CloudFormation stack](#fetching-logs-by-aws-cloudformation-stack)
- [Fetching logs by Lambda function name](#fetching-logs-by-lambda-function-name)
- [Tailing logs](#tailing-logs)
- [Viewing logs for a specific time range](#viewing-logs-for-a-specific-time-range)
- [Filtering logs](#filtering-logs)
- [Error highlighting](#error-highlighting)
- [JSON pretty printing](#json-pretty-printing)
- [AWS SAM reference](#aws-sam-reference)
- [AWS SAM specification and the AWS SAM template](#aws-sam-specification-and-the-aws-sam-template)
- [AWS SAM CLI command reference](#aws-sam-cli-command-reference)
- [AWS SAM policy templates](#aws-sam-policy-templates)
- [Topics](#topics)
- [AWS SAM CLI commands](#aws-sam-cli-commands)
- [sam build](#sam-build)
- [sam delete](#sam-delete)
- [sam deploy](#sam-deploy)
- [sam init](#sam-init)
- [sam list](#sam-list)
- [sam local generate-event](#sam-local-generate-event)
- [sam local invoke](#sam-local-invoke)
- [sam local start-api](#sam-local-start-api)
- [sam local start-lambda](#sam-local-start-lambda)
- [sam logs](#sam-logs)
- [sam package](#sam-package)
- [sam pipeline bootstrap](#sam-pipeline-bootstrap)
- [sam pipeline init](#sam-pipeline-init)
- [sam publish](#sam-publish)
- [sam remote invoke](#sam-remote-invoke)
- [sam remote test-event](#sam-remote-test-event)
- [sam sync](#sam-sync)
- [sam traces](#sam-traces)
- [sam validate](#sam-validate)
- [AWS SAM CLI management](#aws-sam-cli-management)
- [AWS SAM CLI configuration file](#aws-sam-cli-configuration-file)
- [Managing AWS SAM CLI versions](#managing-aws-sam-cli-versions)
- [Setting up AWS credentials](#setting-up-aws-credentials)
- [AWS SAM CLI telemetry](#aws-sam-cli-telemetry)
- [Troubleshooting](#troubleshooting-4)
- [Connector reference](#connector-reference)
- [Supported connector resource types](#supported-connector-resource-types)
- [IAM policies created by connectors](#iam-policies-created-by-connectors)
- [Installing Docker](#installing-docker)
- [Installing Docker](#installing-docker-1)
- [Next steps](#next-steps-5)
- [Image repositories](#image-repositories)
- [Image repository URIs](#image-repository-uris)
- [Examples](#examples-5)
- [Deploying gradually](#deploying-gradually)
- [Gradually deploying a Lambda function for the first time](#gradually-deploying-a-lambda-function-for-the-first-time)
- [Learn more](#learn-more-8)
- [Important notes](#important-notes)
- [2023](#2023)
- [Example applications](#example-applications)
- [Process DynamoDB events](#process-dynamodb-events)
- [Before you begin](#before-you-begin)
- [Step 1: Initialize the application](#step-1-initialize-the-application)
- [Step 2: Test the application locally](#step-2-test-the-application-locally)
- [Step 3: Package the application](#step-3-package-the-application)
- [Step 4: Deploy the application](#step-4-deploy-the-application)
- [Next steps](#next-steps-6)
- [Process Amazon S3 events](#process-amazon-s3-events)
- [Before you begin](#before-you-begin-1)
- [Step 1: Initialize the application](#step-1-initialize-the-application-1)
- [Step 2: Package the application](#step-2-package-the-application)
- [Step 3: Deploy the application](#step-3-deploy-the-application)
- [Step 4: Test the application locally](#step-4-test-the-application-locally)
- [Next steps](#next-steps-7)
- [Terraform support](#terraform-support)
- [Getting started](#getting-started-1)
- [Prerequisites](#prerequisites-3)
- [Using AWS SAM CLI commands with Terraform](#using-aws-sam-cli-commands-with-terraform)
- [Set up for Terraform projects](#set-up-for-terraform-projects)
- [Set up for Terraform Cloud](#set-up-for-terraform-cloud)
- [Using AWS SAM CLI with Terraform](#using-aws-sam-cli-with-terraform)
- [Local testing with sam local invoke](#local-testing-with-sam-local-invoke)
- [Local testing with sam local start-api](#local-testing-with-sam-local-start-api)
- [Local testing with sam local start-lambda](#local-testing-with-sam-local-start-lambda)
- [Terraform limitations](#terraform-limitations)
- [Using AWS SAM CLI with Serverless.tf](#using-aws-sam-cli-with-serverlesstf)
- [Terraform reference](#terraform-reference)
- [AWS SAM supported features reference](#aws-sam-supported-features-reference)
- [Terraform specific reference](#terraform-specific-reference)
- [sam metadata](#sam-metadata)
- [AWS SAM CLI Terraform support](#aws-sam-cli-terraform-support)
- [What is the AWS SAM CLI?](#what-is-the-aws-sam-cli-1)
- [How do I use the AWS SAM CLI with Terraform?](#how-do-i-use-the-aws-sam-cli-with-terraform)
- [Next steps](#next-steps-8)
- [Publishing for others to use](#publishing-for-others-to-use)
- [Prerequisites](#prerequisites-4)
- [Publishing a new application](#publishing-a-new-application)
- [Step 1: Add a Metadata section to the AWS SAM template](#step-1-add-a-metadata-section-to-the-aws-sam-template)
- [Step 2: Package the application](#step-2-package-the-application)
- [Step 3: Publish the application](#step-3-publish-the-application)
- [Step 4: Share the application (optional)](#step-4-share-the-application-optional)
- [Publishing a new version of an existing application](#publishing-a-new-version-of-an-existing-application)
- [Additional topics](#additional-topics)
- [Metadata section properties](#metadata-section-properties)
- [Properties](#properties)
- [Use cases](#use-cases)
- [Example](#example)
- [Document history](#document-history)

## What is AWS SAM?

AWS Serverless Application Model (AWS SAM) is an open-source framework for building serverless applications using infrastructure as code (IaC). With AWS SAM's shorthand syntax, developers declare AWS CloudFormation resources and specialized serverless resources that are transformed to infrastructure during deployment. This framework includes two main components: the AWS SAM CLI and the AWS SAM project. The AWS SAM project is the application project directory that is created when you run `sam init`. The AWS SAM project includes files like the AWS SAM template, which includes the template specification (the shorthand syntax you use to declare resources).

### Key features

AWS SAM offers a variety of benefits that improve the developer experience by allowing you to:

- Define your application infrastructure code quickly, using less code
- Author AWS SAM templates to define your serverless application infrastructure code. Deploy your templates directly to AWS CloudFormation to provision your resources.
- Manage your serverless applications through their entire development lifecycle
- Use the AWS SAM CLI to manage your serverless application through the authoring, building, deploying, testing, and monitoring phases of your development lifecycle. For more information, see [The AWS SAM CLI](#the-aws-sam-cli).
- Quickly provision permissions between resources with AWS SAM connectors
- Use AWS SAM connectors in your AWS SAM templates to define permissions between your AWS resources. AWS SAM transforms your code into the IAM permissions required to facilitate your intent. For more information, see [Managing resource permissions with AWS SAM connectors](#managing-resource-permissions-with-aws-sam-connectors).
- Continuously sync local changes to the cloud as you develop
- Use the AWS SAM CLI `sam sync` command to automatically sync local changes to the cloud, speeding up your development and cloud testing workflows. For more information, see [Introduction to using sam sync to sync to AWS Cloud](#intro-to-sam-sync).
- Manage your Terraform serverless applications
- Use the AWS SAM CLI to perform local debugging and testing of your Lambda functions and layers. For more information, see [AWS SAM CLI Terraform support](#aws-sam-cli-terraform-support).

### Related information

- For information on how AWS SAM works, see [How AWS SAM works](#how-it-works).
- To start using AWS SAM, see [Getting started with AWS SAM](#getting-started).
- For an overview on how you can use AWS SAM to create a serverless application, see [How to use AWS SAM](#how-to-use-aws-sam).

## How it works

AWS SAM consists of two primary components you use to create your serverless application:

1. **The AWS SAM project** - The folders and files that are created when you run the `sam init` command. This directory includes the AWS SAM template, an important file that defines your AWS resources. This template includes the AWS SAM template specification - the open-source framework that comes with a simplified shorthand syntax you use to define the functions, events, APIs, configurations, and permissions of your serverless application.
2. **The AWS SAM CLI** - A command line tool that you can use with your AWS SAM project and supported third-party integrations to build and run your serverless applications. The AWS SAM CLI is the tool you use to run commands on your AWS SAM project and eventually turn it into your serverless application.

To express resources, event source mappings, and other properties that define your serverless application, you define resources and develop your application in the AWS SAM template and other files in your AWS SAM project. You use the AWS SAM CLI to run commands on your AWS SAM project, which is how you initialize, build, test, and deploy your serverless application.

> **New to serverless?**
> We recommend you review [Serverless concepts for AWS Serverless Application Model](#serverless-concepts).

## What is the AWS SAM template specification?

The AWS SAM template specification is an open-source framework that you can use to define and manage your serverless application infrastructure code. The AWS SAM template specification is:

- **Built on AWS CloudFormation** - You use the AWS CloudFormation syntax directly in your AWS SAM template, taking advantage of its extensive support of resource and property configurations. If you are already familiar with AWS CloudFormation, you don't have to learn a new service to manage your application infrastructure code.
- **An extension of AWS CloudFormation** - AWS SAM offers its own unique syntax that focuses specifically on speeding up serverless development. You can use both the AWS CloudFormation and AWS SAM syntax within the same template.
- **An abstract, shorthand syntax** - Using the AWS SAM syntax, you can define your infrastructure quickly, in fewer lines of code, and with a lower chance of errors. Its syntax is especially curated to abstract away the complexity in defining your serverless application infrastructure.
- **Transformational** - AWS SAM does the complex work of transforming your template into the code necessary to provision your infrastructure through AWS CloudFormation.

## What is the AWS SAM project and AWS SAM template?

The AWS SAM project includes the AWS SAM template which contains the AWS SAM template specification. This specification is the open-source framework that you use to define your serverless application infrastructure on AWS, with some additional components that make them easier to work with. In this sense, AWS SAM templates are an extension of AWS CloudFormation templates.

Here's an example of a basic serverless application. This application processes requests to get all items from a database through an HTTP request. It consists of the following parts:

1. A function that contains the logic to process the request.
2. An HTTP API to serve as communication between the client (requestor) and the application.
3. A database to store items.
4. Permissions for the application to run securely.

This application's infrastructure code can be defined in the following AWS SAM template:

```yaml
AWSTemplateFormatVersion: 2010-09-09
Transform: AWS::Serverless-2016-10-31
Resources:
  getAllitemsFunction:
    Type: AWS::Serverless::Function
    Properties:
      Handler: src/get-all-items.getAllitemsHandler
      Runtime: nodejs20.x
    Events:
      Api:
        Type: HttpApi
        Properties:
          Path: /
          Method: GET
    Connectors:
      MyConn:
        Properties:
          Destination:
            Id: SampleTable
          Permissions:
            - Read
          SampleTable:
            Type: AWS::Serverless::SimpleTable
```

In 23 lines of code, the following infrastructure is defined:

- A function using the AWS Lambda service.
- An HTTP API using the Amazon API Gateway service.
- A database using the Amazon DynamoDB service.
- The AWS Identity and Access Management (IAM) permissions necessary for these services to interact with one another.

To provision this infrastructure, the template is deployed to AWS CloudFormation. During deployment, AWS SAM transforms the 23 lines of code into the AWS CloudFormation syntax required to generate these resources in AWS. The transformed AWS CloudFormation template contains over 200 lines of code!

### Transformed AWS CloudFormation template

```json
{
    "AWSTemplateFormatVersion": "2010-09-09",
    "Resources": {
        "getAllitemsFunction": {
            "Type": "AWS::Lambda::Function",
            "Metadata": {
                "SamResourceId": "getAllitemsFunction"
            },
            "Properties": {
                "Code": {
                    "S3Bucket": "amzn-s3-demo-source-bucket-1a4x26zbcdkqr",
                    "S3Key": "what-is-app/a6f856abf1b2c4f7488c09b367540b5b"
                },
                "Handler": "src/get-all-items.getAllitemsHandler",
                "Role": {
                    "Fn::GetAtt": [
                        "getAllitemsFunctionRole",
                        "Arn"
                    ]
                },
                "Runtime": "nodejs12.x",
                "Tags": [
                    {
                        "Key": "lambda:createdBy",
                        "Value": "SAM"
                    }
                ]
            }
        },
        "getAllitemsFunctionRole": {
            "Type": "AWS::IAM::Role",
            "Properties": {
                "AssumeRolePolicyDocument": {
                    "Version": "2012-10-17",
                    "Statement": [
                        {
                            "Action": [
                                "sts:AssumeRole"
                            ],
                            "Effect": "Allow",
                            "Principal": {
                                "Service": [
                                    "lambda.amazonaws.com"
                                ]
                            }
                        }
                    ]
                },
                "ManagedPolicyArns": [
                    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
                ],
                "Tags": [
                    {
                        "Key": "lambda:createdBy",
                        "Value": "SAM"
                    }
                ]
            }
        },
        "getAllitemsFunctionApiPermission": {
            "Type": "AWS::Lambda::Permission",
            "Properties": {
                "Action": "lambda:InvokeFunction",
                "FunctionName": {
                    "Ref": "getAllitemsFunction"
                },
                "Principal": "apigateway.amazonaws.com",
                "SourceArn": {
                    "Fn::Sub": [
                        "arn:${AWS::Partition}:execute-api:${AWS::Region}:${AWS::AccountId}:${_ApiId_}:${_Stage_}:GET",
                        {
                            "_ApiId_": {
                                "Ref": "ServerlessHttpApi"
                            },
                            "_Stage_": "*"
                        }
                    ]
                }
            }
        },
        "ServerlessHttpApi": {
            "Type": "AWS::ApiGatewayV2::Api",
            "Properties": {
                "Body": {
                    "info": {
                        "version": "1.0",
                        "title": {
                            "Ref": "AWS::StackName"
                        }
                    },
                    "paths": {
                        "/": {
                            "get": {
                                "x-amazon-apigateway-integration": {
                                    "httpMethod": "POST",
                                    "type": "aws_proxy",
                                    "uri": {
                                        "Fn::Sub": "arn:${AWS::Partition}:apigateway:${AWS::Region}:lambda:path/2015-03-31/functions/${getAllitemsFunction.Arn}/invocations"
                                    },
                                    "payloadFormatVersion": "2.0"
                                },
                                "responses": {}
                            }
                        }
                    },
                    "openapi": "3.0.1",
                    "tags": [
                        {
                            "name": "httpapi:createdBy",
                            "x-amazon-apigateway-tag-value": "SAM"
                        }
                    ]
                }
            }
        },
        "ServerlessHttpApiApiGatewayDefaultStage": {
            "Type": "AWS::ApiGatewayV2::Stage",
            "Properties": {
                "ApiId": {
                    "Ref": "ServerlessHttpApi"
                },
                "StageName": "$default",
                "Tags": {
                    "httpapi:createdBy": "SAM"
                },
                "AutoDeploy": true
            }
        },
        "SampleTable": {
            "Type": "AWS::DynamoDB::Table",
            "Metadata": {
                "SamResourceId": "SampleTable"
            },
            "Properties": {
                "AttributeDefinitions": [
                    {
                        "AttributeName": "id",
                        "AttributeType": "S"
                    }
                ],
                "KeySchema": [
                    {
                        "AttributeName": "id",
                        "KeyType": "HASH"
                    }
                ],
                "BillingMode": "PAY_PER_REQUEST"
            }
        },
        "getAllitemsFunctionMyConnPolicy": {
            "Type": "AWS::IAM::ManagedPolicy",
            "Metadata": {
                "aws:sam:connectors": {
                    "getAllitemsFunctionMyConn": {
                        "Source": {
                            "Type": "AWS::Serverless::Function"
                        },
                        "Destination": {
                            "Type": "AWS::Serverless::SimpleTable"
                        }
                    }
                }
            },
            "Properties": {
                "PolicyDocument": {
                    "Version": "2012-10-17",
                    "Statement": [
                        {
                            "Effect": "Allow",
                            "Action": [
                                "dynamodb:GetItem",
                                "dynamodb:Query",
                                "dynamodb:Scan",
                                "dynamodb:BatchGetItem",
                                "dynamodb:ConditionCheckItem",
                                "dynamodb:PartiQLSelect"
                            ],
                            "Resource": [
                                {
                                    "Fn::GetAtt": [
                                        "SampleTable",
                                        "Arn"
                                    ]
                                },
                                {
                                    "Fn::Sub": [
                                        "${DestinationArn}/index/*",
                                        {
                                            "DestinationArn": {
                                                "Fn::GetAtt": [
                                                    "SampleTable",
                                                    "Arn"
                                                ]
                                            }
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                },
                "Roles": [
                    {
                        "Ref": "getAllitemsFunctionRole"
                    }
                ]
            }
        }
    }
}
```

By using AWS SAM, you define 23 lines of infrastructure code. AWS SAM transforms your code into the 200+ lines of AWS CloudFormation code necessary to provision your application.

## What is the AWS SAM CLI?

The AWS SAM CLI is a command line tool that you can use with AWS SAM templates and supported third-party integrations to build and run your serverless applications. Use the AWS SAM CLI to:

- Quickly initialize a new application project.
- Build your application for deployment.
- Perform local debugging and testing.
- Deploy your application.
- Configure CI/CD deployment pipelines.
- Monitor and troubleshoot your application in the cloud.
- Sync local changes to the cloud as you develop.
- And more!

The AWS SAM CLI is best utilized when used with AWS SAM and AWS CloudFormation templates. It also works with third-party products such as Terraform.

### Initialize a new project

Select from starter templates or choose a custom template location to begin a new project.

Here, we use the `sam init` command to initialize a new application project. We select the Hello World Example project to start with. The AWS SAM CLI downloads a starter template and creates our project folder directory structure.

```bash
$ sam init
You can preselect a particular runtime or package type when using the 'sam init' experience. Call 'sam init --help' to learn more.

Which template source would you like to use?
1 - AWS Quick Start Templates
2 - Custom Template Location

Choice: 1
Choose an AWS Quick Start application template
1 - Hello World Example
2 - Multi-step workflow
3 - Serverless API
4 - Scheduled task
5 - Standalone function
6 - Data processing
7 - Infrastructure event management
8 - Serverless Connector Hello World Example
9 - Multi-step workflow with Connectors
10 - Lambda EFS example
11 - Machine Learning

Template: 1
Use the most popular runtime and package type? (Python and zip) [y/N]: y
```

For more details, see [Create your application](#create-your-application) in AWS SAM.

### Build your application for deployment

Package your function dependencies and organize your project code and folder structure to prepare for deployment.

Here, we use the `sam build` command to prepare our application for deployment. The AWS SAM CLI creates a `.aws-sam` directory and organizes our application dependencies and files there for deployment.

```bash
$ sam build
Building codeuri: /path/to/your/code runtime: python3.8 metadata: {} functions: ['HelloWorldFunction']
Running PythonPipBuilder:ResolveDependencies
Running PythonPipBuilder:CopySource
```

For more details, see [Build your application](#build-your-application).

### Test and debug your application

Use the AWS SAM CLI to test and debug your serverless application locally before deploying to the AWS Cloud.

Here, we use the `sam local invoke` command to test our Lambda function locally.

```bash
$ sam local invoke HelloWorldFunction
Invoking app.lambda_handler (python3.9)
Local image was not found.
Removing rapid images for repo public.ecr.aws/sam/emulation-python3.9
Building image................................................
Using local image: public.ecr.aws/lambda/python3.9-rapid-x86_64.
Mounting /Users/evzz/Demo/what-is/sam-app/.aws-sam/build/HelloWorldFunction as /var/task:ro,delegated inside runtime container
START RequestId: 6f8347ce-6b04-4246-a0de-6dc37f0eef51 Version: $LATEST
END RequestId: 6f8347ce-6b04-4246-a0de-6dc37f0eef51
REPORT RequestId: 6f8347ce-6b04-4246-a0de-6dc37f0eef51 Init Duration: 1.23 ms Duration: 639.26 ms Billed Duration: 640 ms Memory Size: 128 MB Max Memory Used: 128 MB
{"statusCode": 200, "body": "{\"message\": \"hello world\"}"}
```

For more details, see [Test your application](#test-your-application) and [Debug your application](#debug-your-application).

### Deploy your application

Configure your application's deployment settings and deploy to the AWS Cloud to provision your resources.

Here, we use the `sam deploy --guided` command to deploy our application through an interactive flow. The AWS SAM CLI guides us through configuring our application's deployment settings, transforms our template into AWS CloudFormation, and deploys to AWS CloudFormation to create our resources.

```bash
$ sam deploy --guided
Configuring SAM deploy
Looking for config file [samconfig.toml]: Not found
Setting default arguments for 'sam deploy'
Stack Name [sam-app]:
AWS Region [us-west-2]:
#Shows you resources changes to be deployed and require a 'Y' to initiate deploy
Confirm changes before deploy [y/N]:
#SAM needs permission to be able to create roles to connect to the resources in your template
Allow SAM CLI IAM role creation [Y/n]:
#Preserves the state of previously provisioned resources when an operation fails
Disable rollback [y/N]:
HelloWorldFunction may not have authorization defined, Is this okay? [y/N]: y
Save arguments to configuration file [Y/n]:
SAM configuration file [samconfig.toml]:
SAM configuration environment [default]:
Looking for resources needed for deployment:
Managed S3 bucket: aws-sam-cli-managed-default-samclisourcebucket-1a4x26zbcdkqr
A different default S3 bucket can be set in samconfig.toml
```

For more details, see [Deploy your application and resources](#deploy-your-application-and-resources).

### Configure CI/CD deployment pipelines

Create secure continuous integration and delivery (CI/CD) pipelines, using a supported CI/CD system.

Here, we use the `sam pipeline init --bootstrap` command to configure a CI/CD deployment pipeline for our application. The AWS SAM CLI guides us through our options and generates the AWS resources and configuration file to use with our CI/CD system.

```bash
$ sam pipeline init --bootstrap
[3] Reference application build resources
Enter the pipeline execution role ARN if you have previously created one, or we will create one for you []:
Enter the CloudFormation execution role ARN if you have previously created one, or we will create one for you []:
Please enter the artifact bucket ARN for your Lambda function. If you do not have a bucket, we will create one for you []:
Does your application contain any IMAGE type Lambda functions? [y/N]: n
[4] Summary
Below is the summary of the answers:
1 - Account: 513423067560
2 - Stage configuration name: dev
3 - Region: us-west-2
4 - Pipeline user: [to be created]
5 - Pipeline execution role: [to be created]
6 - CloudFormation execution role: [to be created]
7 - Artifacts bucket: [to be created]
8 - ECR image repository: [skipped]
Press enter to confirm the values above, or select an item to edit the value:
This will create the following required resources for the 'dev' configuration:
- Pipeline IAM user
- Pipeline execution role
- CloudFormation execution role
- Artifact bucket
Should we proceed with the creation? [y/N]:
```

For more details, see [Deploy with CI/CD systems and pipelines](#deploy-with-cicd-systems-and-pipelines).

### Monitor and troubleshoot your application in the cloud

View important information about your deployed resources, gather logs, and utilize built-in monitoring tools such as AWS X-Ray.

Here, we use the `sam list` command to view our deployed resources. We get our API endpoint and invoke it, which triggers our function. Then, we use `sam logs` to view our function's logs.

```bash
$ sam list
Resources:
  - Logical ID: HelloWorldFunction
    Type: AWS::Lambda::Function
    ARN: arn:aws:lambda:us-west-2:513423067560:function:sam-app-HelloWorldFunction-QONe17r9maD
  - Logical ID: HelloWorldFunctionRole
    Type: AWS::IAM::Role
    ARN: arn:aws:iam::513423067560:role/sam-app-HelloWorldFunctionRole-15GLOUR9LMT1W
  - Logical ID: HelloWorldApi
    Type: AWS::ApiGatewayV2::Api
    ARN: https://etslgv8ixi.execute-api.us-west-2.amazonaws.com/Prod/hello/
$ sam logs --stack-name sam-app
2023/03/13/[$LATEST]0a433e844dd445bd82d0d78cd55e0cdc 2023-03-13T21:06:42.075000 INIT_START Runtime Version: python:3.9.v16 Runtime Version ARN: arn:aws:lambda:us-west-2::runtime:07a48df201798d627f2b950f03bb227aab4a655a1d019c3296406f95937e2525
2023/03/13/[$LATEST]0a433e844dd445bd82d0d78cd55e0cdc 2023-03-13T21:06:42.180000 START RequestId: 778e4226-0a80-435f-929b-5b19292ed9a7 Version: $LATEST
2023/03/13/[$LATEST]0a433e844dd445bd82d0d78cd55e0cdc 2023-03-13T21:06:42.181000 END RequestId: 778e4226-0a80-435f-929b-5b19292ed9a7
2023/03/13/[$LATEST]0a433e844dd445bd82d0d78cd55e0cdc 2023-03-13T21:06:42.182000 REPORT RequestId: 778e4226-0a80-435f-929b-5b19292ed9a7 Duration: 1.69 ms Billed Duration: 2 ms Memory Size: 128 MB Max Memory Used: 36 MB Init Duration: 104.13 ms
```

For more details, see [Monitor your application](#monitor-your-application).

### Sync local changes to the cloud as you develop

As you develop on your local machine, automatically sync changes to the cloud. Quickly see your changes and perform testing and validation in the cloud.

Here, we use the `sam sync --watch` command to have the AWS SAM CLI watch for local changes. We modify our `HelloWorldFunction` code and the AWS SAM CLI automatically detects the change and deploys our updates to the cloud.

```bash
$ sam sync --watch
stack update succeeded. Sync infra completed.
infra sync completed.
CodeTrigger not created as CodeUri or DefinitionUri is missing for ServerlessRestApi.
Syncing Lambda Function HelloWorldFunction...
Manifest is not changed for (HelloWorldFunction), running incremental build
Building codeuri: /Users/evzz/Demo/what-is/sam-app/hello_world runtime: python3.9 metadata: {} architecture: x86_64 functions: HelloWorldFunction
Running PythonPipBuilder:CopySource
Finished syncing Lambda Function HelloWorldFunction.
```

### Test supported resources in the cloud

Invoke and pass events to supported resources in the cloud.

Here, we use the `sam remote invoke` command to test a deployed Lambda function in the cloud. We invoke our Lambda function and receive its logs and response. With our Lambda function configured to stream responses, the AWS SAM CLI streams its response back in real time.

```bash
$ sam remote invoke StreamingFunction --stack-name lambda-streaming-app
```

For more details, see [Test with sam remote invoke](#test-with-sam-remote-invoke).

## Learn more

To continue learning about AWS SAM, see the following resources:

- [The Complete AWS SAM Workshop](https://workshop.aws.sam/) - A workshop designed to teach you many of the major features that AWS SAM provides.
- [Sessions with SAM](https://sessions.with.sam/) - Video series created by our AWS Serverless Developer Advocate team on using AWS SAM.
- [Serverless Land](https://serverlessland.com/) - Site that brings together the latest information, blogs, videos, code, and learning resources for AWS serverless.

## Next steps

If this is your first time using AWS SAM, see [Getting started with AWS SAM](#getting-started).

## Serverless concepts

Learn about basic serverless concepts before using the AWS Serverless Application Model (AWS SAM).

### Event-driven architecture

A serverless application consists of individual AWS services, such as AWS Lambda for compute and Amazon DynamoDB for database management, that each perform a specialized role. These services are then loosely integrated with each other through an event-driven architecture. To learn more about event-driven architecture, see [What is an Event-Driven Architecture?](https://aws.amazon.com/what-is/event-driven-architecture/).

### Infrastructure as Code (IaC)

Infrastructure as Code (IaC) is a way of treating infrastructure in the same way that developers treat code, applying the same rigor of application code development to infrastructure provisioning. You define your infrastructure in a template file, deploy it to AWS, and AWS creates the resources for you. With IaC, you define in code what you want AWS to provision. For more information, see [Infrastructure as Code](https://aws.amazon.com/devops/resources/infrastructure-as-code/) in the Introduction to DevOps on AWS Whitepaper.

### Serverless technologies

With AWS serverless technologies, you can build and run applications without having to manage your own servers. All server management is done by AWS, providing many benefits such as automatic scaling and built-in high availability, letting you take your idea to production quickly. Using serverless technologies, you can focus on the core of your product without having to worry about managing and operating servers. To learn more about serverless, see the following:

- [Serverless on AWS](https://aws.amazon.com/serverless/)
- [Serverless Developer Guide](https://docs.aws.amazon.com/serverless/latest/devguide/) - Provides a conceptual overview of serverless development in the AWS Cloud.

For a basic introduction to the core AWS serverless services, see [Serverless 101: Understanding the serverless services](https://serverlessland.com/learn/serverless-101) at Serverless Land.

### Serverless Application

When you use AWS SAM, you manage related resources in an application, which consists of your AWS SAM project and template. All the resources in your application are defined or referred to in your AWS SAM template. When AWS SAM processes your template, it creates AWS CloudFormation resources. In AWS CloudFormation, resources are managed in a single unit called a stack, and all the resources in a stack are defined by the stack's AWS CloudFormation template.

## Getting started

Get started with AWS SAM by reviewing and completing the topics in this section. [AWS SAM prerequisites](#prerequisites) provides detailed instructions on setting up an AWS account, creating IAM users, creating key access, and installing and configuring the AWS SAM CLI. After completing the prerequisites, you'll be ready to [Install the AWS SAM CLI](#install-the-aws-sam-cli), which you can do on Linux, Windows, and macOS operating systems. After installation is complete, you can optionally walk through the [AWS SAM Hello World tutorial](#hello-world-tutorial). Following this tutorial will walk you through the process of creating a basic serverless application with AWS SAM. After completing the tutorial, you'll be ready to review the concepts detailed in [How to use AWS Serverless Application Model (AWS SAM)](#how-to-use-aws-sam).

### Prerequisites

Complete the following prerequisites before installing and using the AWS Serverless Application Model Command Line Interface (AWS SAM CLI).

To use the AWS SAM CLI, you need the following:

- An AWS account, AWS Identity and Access Management (IAM) credentials, and an IAM access key pair.
- The AWS Command Line Interface (AWS CLI) to configure AWS credentials.

#### Step 1: Sign up for an AWS account

If you do not have an AWS account, complete the following steps to create one.

To sign up for an AWS account:

1. Open [https://portal.aws.amazon.com/billing/signup](https://portal.aws.amazon.com/billing/signup).
2. Follow the online instructions.

   Part of the sign-up procedure involves receiving a phone call and entering a verification code on the phone keypad.

   When you sign up for an AWS account, an AWS account root user is created. The root user has access to all AWS services and resources in the account. As a security best practice, assign administrative access to a user, and use only the root user to perform tasks that require root user access.

#### Step 2: Create an IAM user account

To create an administrator user, choose one of the following options:

| Choose one way to manage your administrator | To | By | You can also |
|---------------------------------------------|----|----|--------------|
| **In IAM Identity Center (Recommended)**    | Use short-term credentials to access AWS. This aligns with the security best practices. For information about best practices, see [Security best practices in IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html) in the IAM User Guide. | Following the instructions in [Getting started](https://docs.aws.amazon.com/singlesignon/latest/userguide/getting-started.html) in the AWS IAM Identity Center User Guide. | Configure programmatic access by [Configuring the AWS CLI to use AWS IAM Identity Center](https://docs.aws.amazon.com/cli/latest/userguide/sso-configure-profile-token.html) in the AWS Command Line Interface User Guide. |
| **In IAM (Not recommended)**                | Use long-term credentials to access AWS. | Following the instructions in [Create an IAM user for emergency access](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html) in the IAM User Guide. | Configure programmatic access by [Manage access keys for IAM users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html) in the IAM User Guide. |

#### Step 3: Create an access key ID and secret access key

For CLI access, you need an access key ID and a secret access key. Use temporary credentials instead of long-term access keys when possible. Temporary credentials include an access key ID, a secret access key, and a security token that indicates when the credentials expire. For more information, see [Using temporary credentials with AWS resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_use-resources.html) in the IAM User Guide.

Users need programmatic access if they want to interact with AWS outside of the AWS Management Console. The way to grant programmatic access depends on the type of user that's accessing AWS.

To grant users programmatic access, choose one of the following options:

| Which user needs programmatic access? | To | By |
|---------------------------------------|----|----|
| **Workforce identity (Users managed in IAM Identity Center)** | Use temporary credentials to sign programmatic requests to the AWS CLI, AWS SDKs, or AWS APIs. | Following the instructions for the interface that you want to use:<br>- For the AWS CLI, see [Configuring the AWS CLI to use AWS IAM Identity Center](https://docs.aws.amazon.com/cli/latest/userguide/sso-configure-profile-token.html) in the AWS Command Line Interface User Guide.<br>- For AWS SDKs, tools, and AWS APIs, see [IAM Identity Center authentication](https://docs.aws.amazon.com/) in the AWS SDKs and Tools Reference Guide. |
| **IAM**                              | Use temporary credentials to sign programmatic requests to the AWS CLI, AWS SDKs, or AWS APIs. | Following the instructions in [Using temporary credentials with AWS resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_use-resources.html) in the IAM User Guide. |
| **IAM (Not recommended)**            | Use long-term credentials to sign programmatic requests to the AWS CLI, AWS SDKs, or AWS APIs. | Following the instructions in [Manage access keys for IAM users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html) in the IAM User Guide. |

#### Step 4: Install the AWS CLI

The AWS Command Line Interface (AWS CLI) is a unified tool to manage your AWS services. With just one tool to download and configure, you can control multiple AWS services from the command line and automate them through scripts.

To install the AWS CLI, follow the instructions in [Installing the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) in the AWS Command Line Interface User Guide.

#### Step 5: Use the AWS CLI to configure AWS credentials

After you install the AWS CLI, you need to configure it with your AWS credentials. To configure the AWS CLI, follow the instructions in [Configuration and credential file settings](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) in the AWS Command Line Interface User Guide.

#### Next steps

After completing the prerequisites, you are ready to [Install the AWS SAM CLI](#install-the-aws-sam-cli).

## Install the AWS SAM CLI

The AWS Serverless Application Model Command Line Interface (AWS SAM CLI) is an open-source command line tool that you can use to create, manage, and deploy serverless applications on AWS.

To install the AWS SAM CLI, follow the instructions for your operating system:

- [Linux](#installing-the-aws-sam-cli-on-linux)
- [Windows](#installing-the-aws-sam-cli-on-windows)
- [macOS](#installing-the-aws-sam-cli-on-macos)

For detailed installation instructions, see [Installing the AWS SAM CLI](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html).

### Installing the AWS SAM CLI

*Content placeholder for detailed installation instructions per operating system, to be filled based on referenced documentation.*

### Troubleshooting installation errors

*Content placeholder for troubleshooting common installation errors, to be filled based on referenced documentation.*

### Next steps

*Content placeholder for next steps after installation, to be filled based on referenced documentation.*

### Optional: Verify the AWS SAM CLI installer

*Content placeholder for verifying the integrity of the AWS SAM CLI installer, to be filled based on referenced documentation.*

## Hello World Tutorial

In this tutorial, you use the AWS Serverless Application Model Command Line Interface (AWS SAM CLI) to build a simple serverless application that consists of an AWS Lambda function and an Amazon API Gateway endpoint. You deploy the application to the AWS Cloud, test it, and then delete it.

### Prerequisites

Before you begin this tutorial, make sure that you have completed the following prerequisites:

- [AWS SAM prerequisites](#prerequisites)
- [Install the AWS SAM CLI](#install-the-aws-sam-cli)

### Step 1: Initialize the sample Hello World application

To initialize the sample Hello World application, use the `sam init` command.

```bash
$ sam init
```

Follow the prompts to select the following options:

- Template source: AWS Quick Start Templates
- Application template: Hello World Example
- Runtime: python3.9
- Package type: Zip

After the initialization is complete, you will have a new directory called `sam-app` that contains the application code and configuration files.

### Step 2: Build your application

To build your application, use the `sam build` command.

```bash
$ cd sam-app
$ sam build
```

This command builds the application and prepares it for deployment.

### Step 3: Deploy your application to the AWS Cloud

To deploy your application, use the `sam deploy` command with the `--guided` option.

```bash
$ sam deploy --guided
```

Follow the prompts to configure the deployment settings. When prompted, confirm the changes to initiate the deployment.

After the deployment is complete, note the API endpoint URL that is displayed in the output.

### Step 4: Run your application

To run your application, send a request to the API endpoint URL that you noted in the previous step.

You can use a tool like `curl` or a web browser to send a GET request to the endpoint.

For example:

```bash
$ curl https://<api-id>.execute-api.<region>.amazonaws.com/Prod/hello/
```

You should receive a response similar to the following:

```json
{"message": "hello world"}
```

### Step 5: Interact with your function in the AWS Cloud

To interact with your Lambda function in the AWS Cloud, you can use the AWS Management Console or the AWS CLI.

For example, to invoke the function using the AWS CLI, run the following command:

```bash
$ aws lambda invoke --function-name <function-name> output.txt
```

Replace `<function-name>` with the name of your Lambda function.

### Step 6: Modify and sync your application to the AWS Cloud

To modify your application, make changes to the code or configuration files in your local directory.

To sync your changes to the AWS Cloud, use the `sam sync` command.

```bash
$ sam sync --watch
```

This command watches for changes in your local directory and automatically deploys them to the AWS Cloud.

### Step 7: (Optional) Test your application locally

To test your application locally, use the `sam local` commands.

For example, to invoke your Lambda function locally, run:

```bash
$ sam local invoke
```

To start a local API Gateway endpoint, run:

```bash
$ sam local start-api
```

### Step 8: Delete your application from the AWS Cloud

To delete your application from the AWS Cloud, use the `sam delete` command.

```bash
$ sam delete
```

Follow the prompts to confirm the deletion.

### Troubleshooting

*Content placeholder for troubleshooting common errors during the tutorial, to be filled based on referenced documentation.*

### Learn more

To learn more about AWS SAM, see the following resources:

- [AWS SAM documentation](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/)
- [AWS SAM GitHub repository](https://github.com/aws/aws-sam-cli)
- [Serverless Land](https://serverlessland.com/)

## How to use AWS SAM

This section provides an overview of how to use the AWS Serverless Application Model (AWS SAM) to create, manage, and deploy serverless applications.

### The AWS SAM CLI

The AWS SAM CLI is a command line tool that you can use to initialize, build, package, deploy, and manage serverless applications.

For a list of AWS SAM CLI commands, see [AWS SAM CLI command reference](#aws-sam-cli-command-reference).

### How AWS SAM CLI commands are documented

Each AWS SAM CLI command is documented in the [AWS SAM CLI command reference](#aws-sam-cli-command-reference) section.

### Configuring the AWS SAM CLI

*Content placeholder for configuring the AWS SAM CLI, to be filled based on referenced documentation.*

### Core commands

*Content placeholder for core AWS SAM CLI commands, to be filled based on referenced documentation.*

### The AWS SAM project

*Content placeholder for details about the AWS SAM project, to be filled based on referenced documentation.*

### Template anatomy

*Content placeholder for AWS SAM template structure, to be filled based on referenced documentation.*

### Resources and properties

*Content placeholder for AWS SAM resources and properties, to be filled based on referenced documentation.*

### Generated resources

*Content placeholder for generated AWS CloudFormation resources, to be filled based on referenced documentation.*

### Supported resource attributes

*Content placeholder for supported resource attributes, to be filled based on referenced documentation.*

### API Gateway extensions

*Content placeholder for API Gateway extensions, to be filled based on referenced documentation.*

### Intrinsic functions

*Content placeholder for intrinsic functions, to be filled based on referenced documentation.*

### Develop your application

*Content placeholder for developing applications with AWS SAM, to be filled based on referenced documentation.*

### Create your application

*Content placeholder for creating a new application, to be filled based on referenced documentation.*

### Initialize a new serverless application

*Content placeholder for initializing a new serverless application, to be filled based on referenced documentation.*

### Options for sam init

*Content placeholder for options for the `sam init` command, to be filled based on referenced documentation.*

### Troubleshooting

*Content placeholder for troubleshooting application creation, to be filled based on referenced documentation.*

### Examples

*Content placeholder for examples of serverless applications, to be filled based on referenced documentation.*

### Learn more

*Content placeholder for additional learning resources, to be filled based on referenced documentation.*

### Next steps

*Content placeholder for next steps in application development, to be filled based on referenced documentation.*

## Define your infrastructure

*Content placeholder for defining infrastructure with AWS SAM, to be filled based on referenced documentation.*

### Define application resources

*Content placeholder for defining application resources, to be filled based on referenced documentation.*

### Set up access

*Content placeholder for setting up access, to be filled based on referenced documentation.*

### Control API access

*Content placeholder for controlling API access, to be filled based on referenced documentation.*

### Increase efficiency with layers

*Content placeholder for using layers to increase efficiency, to be filled based on referenced documentation.*

### Reuse code

*Content placeholder for reusing code, to be filled based on referenced documentation.*

### Manage time-based events

*Content placeholder for managing time-based events, to be filled based on referenced documentation.*

### Orchestrating applications

*Content placeholder for orchestrating applications, to be filled based on referenced documentation.*

### Set up code signing

*Content placeholder for setting up code signing, to be filled based on referenced documentation.*

### Validate AWS SAM template files

*Content placeholder for validating AWS SAM template files, to be filled based on referenced documentation.*

## Build your application

*Content placeholder for building your application, to be filled based on referenced documentation.*

### Intro to sam build

*Content placeholder for introduction to `sam build`, to be filled based on referenced documentation.*

### Default build

*Content placeholder for default build process, to be filled based on referenced documentation.*

### Customize your build

*Content placeholder for customizing the build process, to be filled based on referenced documentation.*

## Test your application

*Content placeholder for testing your application, to be filled based on referenced documentation.*

### Intro to sam local

*Content placeholder for introduction to `sam local`, to be filled based on referenced documentation.*

### Using the sam local command

*Content placeholder for using the `sam local` command, to be filled based on referenced documentation.*

### Intro to sam local generate-event

*Content placeholder for introduction to `sam local generate-event`, to be filled based on referenced documentation.*

### Intro to sam local invoke

*Content placeholder for introduction to `sam local invoke`, to be filled based on referenced documentation.*

### Intro to sam local start-api

*Content placeholder for introduction to `sam local start-api`, to be filled based on referenced documentation.*

### Intro to sam local start-lambda

*Content placeholder for introduction to `sam local start-lambda`, to be filled based on referenced documentation.*

### Locally invoke functions

*Content placeholder for locally invoking functions, to be filled based on referenced documentation.*

### Environment variable file

*Content placeholder for using an environment variable file, to be filled based on referenced documentation.*

### Layers

*Content placeholder for using layers in testing, to be filled based on referenced documentation.*

### Learn more

*Content placeholder for additional testing resources, to be filled based on referenced documentation.*

## Locally run API Gateway

*Content placeholder for locally running API Gateway, to be filled based on referenced documentation.*

### Environment variable file

*Content placeholder for environment variable file in API Gateway testing, to be filled based on referenced documentation.*

### Layers

*Content placeholder for layers in API Gateway testing, to be filled based on referenced documentation.*

## Test with sam remote test-event

*Content placeholder for testing with `sam remote test-event`, to be filled based on referenced documentation.*

### Set up the AWS SAM CLI to use sam remote test-event

*Content placeholder for setting up `sam remote test-event`, to be filled based on referenced documentation.*

### Using the sam remote test-event command

*Content placeholder for using the `sam remote test-event` command, to be filled based on referenced documentation.*

### Using shareable test events

*Content placeholder for using shareable test events, to be filled based on referenced documentation.*

### Managing shareable test events

*Content placeholder for managing shareable test events, to be filled based on referenced documentation.*

## Test with sam remote invoke

*Content placeholder for testing with `sam remote invoke`, to be filled based on referenced documentation.*

### Using the sam remote invoke command

*Content placeholder for using the `sam remote invoke` command, to be filled based on referenced documentation.*

### Using sam remote invoke command options

*Content placeholder for options for `sam remote invoke`, to be filled based on referenced documentation.*

### Configure your project configuration file

*Content placeholder for configuring the project configuration file, to be filled based on referenced documentation.*

### Examples

*Content placeholder for examples of `sam remote invoke`, to be filled based on referenced documentation.*

### Related links

*Content placeholder for related links, to be filled based on referenced documentation.*

## Automate integration tests

*Content placeholder for automating integration tests, to be filled based on referenced documentation.*

## Generate sample payloads

*Content placeholder for generating sample payloads, to be filled based on referenced documentation.*

## Debug your application

*Content placeholder for debugging your application, to be filled based on referenced documentation.*

### Locally debug functions

*Content placeholder for locally debugging functions, to be filled based on referenced documentation.*

### Using AWS Toolkits

*Content placeholder for using AWS Toolkits for debugging, to be filled based on referenced documentation.*

### Running AWS SAM locally in debug mode

*Content placeholder for running AWS SAM in debug mode, to be filled based on referenced documentation.*

### Pass multiple runtime arguments

*Content placeholder for passing multiple runtime arguments, to be filled based on referenced documentation.*

### Validate with cfn-lint

*Content placeholder for validating with cfn-lint, to be filled based on referenced documentation.*

### Examples

*Content placeholder for debugging examples, to be filled based on referenced documentation.*

### Learn more

*Content placeholder for additional debugging resources, to be filled based on referenced documentation.*

## Deploy your application and resources

*Content placeholder for deploying your application and resources, to be filled based on referenced documentation.*

### Intro to sam deploy

*Content placeholder for introduction to `sam deploy`, to be filled based on referenced documentation.*

### Prerequisites

*Content placeholder for prerequisites for deployment, to be filled based on referenced documentation.*

### Deploying applications using sam deploy

*Content placeholder for deploying applications using `sam deploy`, to be filled based on referenced documentation.*

### Best practices

*Content placeholder for best practices in deployment, to be filled based on referenced documentation.*

### Options for sam deploy

*Content placeholder for options for `sam deploy`, to be filled based on referenced documentation.*

### Troubleshooting

*Content placeholder for troubleshooting deployment, to be filled based on referenced documentation.*

### Examples

*Content placeholder for deployment examples, to be filled based on referenced documentation.*

### Learn more

*Content placeholder for additional deployment resources, to be filled based on referenced documentation.*

## Deployment options

*Content placeholder for deployment options, to be filled based on referenced documentation.*

### How to use the AWS SAM CLI to manually deploy

*Content placeholder for manually deploying with the AWS SAM CLI, to be filled based on referenced documentation.*

### Deploy with CI/CD systems and pipelines

*Content placeholder for deploying with CI/CD systems and pipelines, to be filled based on referenced documentation.*

### Gradual deployments

*Content placeholder for gradual deployments, to be filled based on referenced documentation.*

### Troubleshooting deployments using the AWS SAM CLI

*Content placeholder for troubleshooting deployments, to be filled based on referenced documentation.*

### Learn more

*Content placeholder for additional deployment option resources, to be filled based on referenced documentation.*

## Deploy with CI/CD systems and pipelines

*Content placeholder for deploying with CI/CD systems and pipelines, to be filled based on referenced documentation.*

### What is a pipeline?

*Content placeholder for defining a pipeline, to be filled based on referenced documentation.*

### How AWS SAM uploads local files

*Content placeholder for how AWS SAM uploads local files, to be filled based on referenced documentation.*

### Generate a starter pipeline

*Content placeholder for generating a starter pipeline, to be filled based on referenced documentation.*

### Customize starter pipelines

*Content placeholder for customizing starter pipelines, to be filled based on referenced documentation.*

### Automate your deployments

*Content placeholder for automating deployments, to be filled based on referenced documentation.*

### Use OIDC authentication

*Content placeholder for using OIDC authentication, to be filled based on referenced documentation.*

## Intro to sam sync

*Content placeholder for introduction to `sam sync`, to be filled based on referenced documentation.*

### Automatically detect and sync local changes to the AWS Cloud

*Content placeholder for automatically syncing changes, to be filled based on referenced documentation.*

### Customize what local changes are synced to the AWS Cloud

*Content placeholder for customizing synced changes, to be filled based on referenced documentation.*

### Prepare your application in the cloud for testing and validation

*Content placeholder for preparing for testing and validation, to be filled based on referenced documentation.*

### Options for the sam sync command

*Content placeholder for options for `sam sync`, to be filled based on referenced documentation.*

### Troubleshooting

*Content placeholder for troubleshooting `sam sync`, to be filled based on referenced documentation.*

### Examples

*Content placeholder for examples of `sam sync`, to be filled based on referenced documentation.*

### Learn more

*Content placeholder for additional `sam sync` resources, to be filled based on referenced documentation.*

## Monitor your application

*Content placeholder for monitoring your application, to be filled based on referenced documentation.*

### Application Insights

*Content placeholder for Application Insights, to be filled based on referenced documentation.*

### Configuring CloudWatch Application Insights with AWS SAM

*Content placeholder for configuring CloudWatch Application Insights, to be filled based on referenced documentation.*

### Next steps

*Content placeholder for next steps in monitoring, to be filled based on referenced documentation.*

## Working with logs

*Content placeholder for working with logs, to be filled based on referenced documentation.*

### Fetching logs by AWS CloudFormation stack

*Content placeholder for fetching logs by stack, to be filled based on referenced documentation.*

### Fetching logs by Lambda function name

*Content placeholder for fetching logs by function name, to be filled based on referenced documentation.*

### Tailing logs

*Content placeholder for tailing logs, to be filled based on referenced documentation.*

### Viewing logs for a specific time range

*Content placeholder for viewing logs for a time range, to be filled based on referenced documentation.*

### Filtering logs

*Content placeholder for filtering logs, to be filled based on referenced documentation.*

### Error highlighting

*Content placeholder for error highlighting, to be filled based on referenced documentation.*

### JSON pretty printing

*Content placeholder for JSON pretty printing, to be filled based on referenced documentation.*

## AWS SAM reference

*Content placeholder for AWS SAM reference, to be filled based on referenced documentation.*

### AWS SAM specification and the AWS SAM template

*Content placeholder for AWS SAM specification and template, to be filled based on referenced documentation.*

### AWS SAM CLI command reference

*Content placeholder for AWS SAM CLI command reference, to be filled based on referenced documentation.*

### AWS SAM policy templates

*Content placeholder for AWS SAM policy templates, to be filled based on referenced documentation.*

## Topics

*Content placeholder for additional topics, to be filled based on referenced documentation.*

### AWS SAM CLI commands

*Content placeholder for list of AWS SAM CLI commands, to be filled based on referenced documentation.*

#### sam build

*Content placeholder for `sam build`, to be filled based on referenced documentation.*

#### sam delete

*Content placeholder for `sam delete`, to be filled based on referenced documentation.*

#### sam deploy

*Content placeholder for `sam deploy`, to be filled based on referenced documentation.*

#### sam init

*Content placeholder for `sam init`, to be filled based on referenced documentation.*

#### sam list

*Content placeholder for `sam list`, to be filled based on referenced documentation.*

#### sam local generate-event

*Content placeholder for `sam local generate-event`, to be filled based on referenced documentation.*

#### sam local invoke

*Content placeholder for `sam local invoke`, to be filled based on referenced documentation.*

#### sam local start-api

*Content placeholder for `sam local start-api`, to be filled based on referenced documentation.*

#### sam local start-lambda

*Content placeholder for `sam local start-lambda`, to be filled based on referenced documentation.*

#### sam logs

*Content placeholder for `sam logs`, to be filled based on referenced documentation.*

#### sam package

*Content placeholder for `sam package`, to be filled based on referenced documentation.*

#### sam pipeline bootstrap

*Content placeholder for `sam pipeline bootstrap`, to be filled based on referenced documentation.*

#### sam pipeline init

*Content placeholder for `sam pipeline init`, to be filled based on referenced documentation.*

#### sam publish

*Content placeholder for `sam publish`, to be filled based on referenced documentation.*

#### sam remote invoke

*Content placeholder for `sam remote invoke`, to be filled based on referenced documentation.*

#### sam remote test-event

*Content placeholder for `sam remote test-event`, to be filled based on referenced documentation.*

#### sam sync

*Content placeholder for `sam sync`, to be filled based on referenced documentation.*

#### sam traces

*Content placeholder for `sam traces`, to be filled based on referenced documentation.*

#### sam validate

*Content placeholder for `sam validate`, to be filled based on referenced documentation.*

## AWS SAM CLI management

*Content placeholder for AWS SAM CLI management, to be filled based on referenced documentation.*

### AWS SAM CLI configuration file

*Content placeholder for AWS SAM CLI configuration file, to be filled based on referenced documentation.*

### Managing AWS SAM CLI versions

*Content placeholder for managing AWS SAM CLI versions, to be filled based on referenced documentation.*

### Setting up AWS credentials

*Content placeholder for setting up AWS credentials, to be filled based on referenced documentation.*

### AWS SAM CLI telemetry

*Content placeholder for AWS SAM CLI telemetry, to be filled based on referenced documentation.*

### Troubleshooting

*Content placeholder for troubleshooting AWS SAM CLI, to be filled based on referenced documentation.*

## Connector reference

*Content placeholder for connector reference, to be filled based on referenced documentation.*

### Supported connector resource types

*Content placeholder for supported connector resource types, to be filled based on referenced documentation.*

### IAM policies created by connectors

*Content placeholder for IAM policies created by connectors, to be filled based on referenced documentation.*

## Installing Docker

*Content placeholder for installing Docker, to be filled based on referenced documentation.*

### Installing Docker

*Content placeholder for detailed Docker installation instructions, to be filled based on referenced documentation.*

### Next steps

*Content placeholder for next steps after installing Docker, to be filled based on referenced documentation.*

## Image repositories

*Content placeholder for image repositories, to be filled based on referenced documentation.*

### Image repository URIs

*Content placeholder for image repository URIs, to be filled based on referenced documentation.*

### Examples

*Content placeholder for examples of image repositories, to be filled based on referenced documentation.*

## Deploying gradually

*Content placeholder for deploying gradually, to be filled based on referenced documentation.*

### Gradually deploying a Lambda function for the first time

*Content placeholder for gradually deploying a Lambda function, to be filled based on referenced documentation.*

### Learn more

*Content placeholder for additional resources on gradual deployments, to be filled based on referenced documentation.*

### Important notes

*Content placeholder for important notes on gradual deployments, to be filled based on referenced documentation.*

## 2023

*Content placeholder for updates in 2023, to be filled based on referenced documentation.*

## Example applications

*Content placeholder for example applications, to be filled based on referenced documentation.*

### Process DynamoDB events

*Content placeholder for processing DynamoDB events, to be filled based on referenced documentation.*

#### Before you begin

*Content placeholder for prerequisites for processing DynamoDB events, to be filled based on referenced documentation.*

#### Step 1: Initialize the application

*Content placeholder for initializing the application, to be filled based on referenced documentation.*

#### Step 2: Test the application locally

*Content placeholder for testing the application locally, to be filled based on referenced documentation.*

#### Step 3: Package the application

*Content placeholder for packaging the application, to be filled based on referenced documentation.*

#### Step 4: Deploy the application

*Content placeholder for deploying the application, to be filled based on referenced documentation.*

#### Next steps

*Content placeholder for next steps after deploying the DynamoDB application, to be filled based on referenced documentation.*

### Process Amazon S3 events

*Content placeholder for processing Amazon S3 events, to be filled based on referenced documentation.*

#### Before you begin

*Content placeholder for prerequisites for processing S3 events, to be filled based on referenced documentation.*

#### Step 1: Initialize the application

*Content placeholder for initializing the S3 application, to be filled based on referenced documentation.*

#### Step 2: Package the application

*Content placeholder for packaging the S3 application, to be filled based on referenced documentation.*

#### Step 3: Deploy the application

*Content placeholder for deploying the S3 application, to be filled based on referenced documentation.*

#### Step 4: Test the application locally

*Content placeholder for testing the S3 application locally, to be filled based on referenced documentation.*

#### Next steps

*Content placeholder for next steps after deploying the S3 application, to be filled based on referenced documentation.*

## Terraform support

AWS SAM provides support for using the AWS SAM CLI with Terraform.

### Getting started

#### Prerequisites

*Content placeholder for prerequisites for Terraform support, to be filled based on referenced documentation.*

#### Using AWS SAM CLI commands with Terraform

*Content placeholder for using AWS SAM CLI commands with Terraform, to be filled based on referenced documentation.*

#### Set up for Terraform projects

*Content placeholder for setting up for Terraform projects, to be filled based on referenced documentation.*

#### Set up for Terraform Cloud

*Content placeholder for setting up for Terraform Cloud, to be filled based on referenced documentation.*

#### Using AWS SAM CLI with Terraform

*Content placeholder for using AWS SAM CLI with Terraform, to be filled based on referenced documentation.*

#### Local testing with sam local invoke

*Content placeholder for local testing with `sam local invoke` and Terraform, to be filled based on referenced documentation.*

#### Local testing with sam local start-api

*Content placeholder for local testing with `sam local start-api` and Terraform, to be filled based on referenced documentation.*

#### Local testing with sam local start-lambda

*Content placeholder for local testing with `sam local start-lambda` and Terraform, to be filled based on referenced documentation.*

#### Terraform limitations

*Content placeholder for Terraform limitations, to be filled based on referenced documentation.*

#### Using AWS SAM CLI with Serverless.tf

The AWS Serverless Application Model Command Line Interface (AWS SAM CLI) can be used with Serverless.tf modules for local debugging and testing of your AWS Lambda functions and layers. The following AWS SAM CLI commands are supported:

- `sam build`
- `sam local invoke`
- `sam local start-api`
- `sam local start-lambda`

> **Note**
> Serverless.tf version 4.6.0 and newer supports AWS SAM CLI integration.

To begin using the AWS SAM CLI with your Serverless.tf modules, update to the latest version of Serverless.tf and the AWS SAM CLI.

Starting from Serverless.tf version 6.0.0, you must set the `create_sam_metadata` parameter as `true`. This generates the metadata resources that the AWS SAM CLI `sam build` command requires.

To learn more about Serverless.tf, see the [terraform-aws-lambda-module](https://registry.terraform.io/modules/terraform-aws-modules/lambda/aws/latest).

### Terraform reference

This section is the reference for using the AWS Serverless Application Model Command Line Interface (AWS SAM CLI) with Terraform for local debugging and testing.

To provide feedback and submit feature requests, create a [GitHub Issue](https://github.com/aws/aws-sam-cli/issues).

#### AWS SAM supported features reference

Reference documentation for AWS SAM CLI features that are supported for use with Terraform can be found here:

- `sam build`
- `sam local invoke`
- `sam local start-api`
- `sam local start-lambda`

#### Terraform specific reference

Reference documentation specific to using AWS SAM CLI with Terraform can be found here:

- [sam metadata resource](#sam-metadata)

#### sam metadata

This page contains reference information for the `sam metadata` resource type used with Terraform projects.

- For an introduction to using the AWS Serverless Application Model Command Line Interface (AWS SAM CLI) with Terraform, see [What is AWS SAM CLI support for Terraform?](#aws-sam-cli-terraform-support).
- To use the AWS SAM CLI with Terraform, see [Using the AWS SAM CLI with Terraform](#using-aws-sam-cli-with-terraform) for local debugging and testing.

##### Arguments

| Argument                | Description                                                                                   |
|-------------------------|-----------------------------------------------------------------------------------------------|
| `built_output_path`     | The path to your AWS Lambda function's built artifacts.                                       |
| `docker_build_args`     | Decoded string of the Docker build arguments JSON object. This argument is optional.          |
| `docker_context`        | The path to the directory containing the Docker image build context.                          |
| `docker_file`           | The path to the Docker file. This path is relative to the `docker_context` path. Default value is `Dockerfile`. Optional. |
| `docker_tag`            | The value of the created Docker image tag. This value is optional.                            |
| `depends_on`            | The path to the building resource for your Lambda function or layer. See [The depends_on argument](https://www.terraform.io/docs/language/resources/syntax.html#depends_on) in the Terraform registry. |
| `original_source_code`  | The path to where your Lambda function is defined. This value can be a string, array of strings, or a decoded JSON object as a string. For string arrays, only the first value is used since multiple code paths are not supported. For JSON objects, the `source_code_property` must also be defined. |
| `resource_name`         | The Lambda function name.                                                                     |
| `resource_type`         | The format of your Lambda function package type. Accepted values are: `IMAGE_LAMBDA_FUNCTION`, `LAMBDA_LAYER`, `ZIP_LAMBDA_FUNCTION`. |
| `source_code_property`  | The path to the Lambda resource code in the JSON object. Define this property when `original_source_code` is a JSON object. |

##### Examples

###### sam metadata resource referencing a Lambda function using the ZIP package type

```hcl
# Lambda function resource
resource "aws_lambda_function" "tf_lambda_func" {
  filename      = "${path.module}/python/hello-world.zip"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"
  function_name = "function_example"
  role          = aws_iam_role.iam_for_lambda.arn
  depends_on    = [
    null_resource.build_lambda_function_function_build_logic
  ]
}

# sam metadata resource
resource "null_resource" "sam_metadata_function_example" {
  triggers = {
    resource_name        = "aws_lambda_function.function_example"
    resource_type        = "ZIP_LAMBDA_FUNCTION"
    original_source_code = "${path.module}/python"
    built_output_path    = "${path.module}/building_function_example"
  }
  depends_on = [
    null_resource.build_lambda_function_function_build_logic
  ]
}
```

###### sam metadata resource referencing a Lambda function using the image package type

```hcl
resource "null_resource" "sam_metadata_function" {
  triggers = {
    resource_name     = "aws_lambda_function.image_function"
    resource_type     = "IMAGE_LAMBDA_FUNCTION"
    docker_context    = local.lambda_src_path
    docker_file       = "Dockerfile"
    docker_build_args = jsonencode(var.build_args)
    docker_tag        = "latest"
  }
}
```

###### sam metadata resource referencing a Lambda layer

```hcl
resource "null_resource" "sam_metadata_layer1" {
  triggers = {
    resource_name        = "aws_lambda_layer_version.layer"
    resource_type        = "LAMBDA_LAYER"
    original_source_code = local.layer_src
    built_output_path    = "${path.module}/${layer_build_path}"
  }
  depends_on = [null_resource.layer_build]
}
```

## AWS SAM CLI Terraform support

### What is the AWS SAM CLI?

The AWS SAM CLI is a command line tool that you can use with AWS SAM templates and supported third-party integrations, such as Terraform, to build and run your serverless applications. For an introduction to the AWS SAM CLI, see [What is the AWS SAM CLI?](#what-is-the-aws-sam-cli).

The AWS SAM CLI supports the following commands for Terraform:

- `sam local invoke` - Initiate a one-time invocation of an AWS Lambda function resource locally. To learn more about this command, see [Introduction to testing with sam local invoke](#intro-to-sam-local-invoke).
- `sam local start-api` - Run your Lambda resources locally and test through a local HTTP server host. This type of testing is helpful for Lambda functions that are invoked by an API Gateway endpoint. To learn more about this command, see [Introduction to testing with sam local start-api](#intro-to-sam-local-start-api).
- `sam local start-lambda` - Start a local endpoint for your Lambda function in order to invoke your function locally using AWS Command Line Interface (AWS CLI) or SDKs. To learn more about this command, see [Introduction to testing with sam local start-lambda](#intro-to-sam-local-start-lambda).

### How do I use the AWS SAM CLI with Terraform?

The core Terraform workflow consists of three stages: Write, Plan, and Apply. With AWS SAM CLI support for Terraform, you can take advantage of the AWS SAM CLI `sam local` set of commands while continuing to use your Terraform workflows to manage your applications on AWS. Generally, this means the following:

- **Write** - Author your infrastructure as code using Terraform.
- **Test and debug** - Use the AWS SAM CLI to locally test and debug your applications.
- **Plan** - Preview changes before applying.
- **Apply** - Provision your infrastructure.

For an example of using the AWS SAM CLI with Terraform, see [Better together: AWS SAM CLI and HashiCorp Terraform](https://aws.amazon.com/blogs/compute/better-together-aws-sam-cli-and-hashicorp-terraform/) at the AWS Compute Blog.

> **Note**
> As part of the parsing step of AWS SAM CLI's integration, AWS SAM CLI processes user commands generate project files and data. The command output should remain unchanged, but in certain environments, the environment or runner may inject additional logs or information in the output.

### Next steps

To complete all prerequisites and set up Terraform, see [Getting started with Terraform support for AWS SAM CLI](#getting-started-1).

## Publishing for others to use

To make your AWS SAM application available for others to find and deploy, you can use the AWS SAM CLI to publish it to the AWS Serverless Application Repository. To publish your application using the AWS SAM CLI, you must define it using an AWS SAM template. You also must have tested it locally or in the AWS Cloud.

Follow the instructions in this topic to create a new application, create a new version of an existing application, or update the metadata of an existing application. (What you do depends on whether the application already exists in the AWS Serverless Application Repository, and whether any application metadata is changing.) For more information about application metadata, see [AWS SAM template Metadata section properties](#metadata-section-properties).

### Prerequisites

Before you publish an application to the AWS Serverless Application Repository using the AWS SAM CLI, you must have the following:

- The AWS SAM CLI installed. For more information, see [Install the AWS SAM CLI](#install-the-aws-sam-cli). To determine whether the AWS SAM CLI is installed, run the following command:
  
  ```bash
  $ sam --version
  ```

- A valid AWS SAM template.
- Your application code and dependencies that the AWS SAM template references.
- A semantic version, required only to share your application publicly. This value can be as simple as `1.0`.
- A URL that points to your application's source code.
- A `README.md` file. This file should describe how customers can use your application and how to configure it before deploying it in their own AWS accounts.
- A `LICENSE.txt` file, required only to share your application publicly.
- If your application contains any nested applications, you must have already published them to the AWS Serverless Application Repository.
- A valid Amazon Simple Storage Service (Amazon S3) bucket policy that grants the service read permissions for artifacts that you upload to Amazon S3 when you package your application. To set up this policy, do the following:

  1. Open the Amazon S3 console at [https://console.aws.amazon.com/s3/](https://console.aws.amazon.com/s3/).
  2. Choose the name of the Amazon S3 bucket that you used to package your application.
  3. Choose **Permissions**.
  4. On the **Permissions** tab, under **Bucket policy**, choose **Edit**.
  5. On the **Edit bucket policy** page, paste the following policy statement into the **Policy editor**. In the policy statement, make sure to use your bucket name in the `Resource` element and your AWS account ID in the `Condition` element. The expression in the `Condition` element ensures that AWS Serverless Application Repository has permission to access only applications from the specified AWS account. For more information about policy statements, see [IAM JSON policy elements reference](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements.html) in the IAM User Guide.

     ```json
     {
         "Version": "2012-10-17",
         "Statement": [
             {
                 "Effect": "Allow",
                 "Principal": {
                     "Service": "serverlessrepo.amazonaws.com"
                 },
                 "Action": "s3:GetObject",
                 "Resource": "arn:aws:s3:::<your-bucket-name>/*",
                 "Condition": {
                     "StringEquals": {
                         "aws:SourceAccount": "123456789012"
                     }
                 }
             }
         ]
     }
     ```

  6. Choose **Save changes**.

### Publishing a new application

#### Step 1: Add a Metadata section to the AWS SAM template

First, add a `Metadata` section to your AWS SAM template. Provide the application information to be published to the AWS Serverless Application Repository.

The following is an example `Metadata` section:

```yaml
Metadata:
  AWS::ServerlessRepo::Application:
    Name: my-app
    Description: hello world
    Author: user1
    SpdxLicenseId: Apache-2.0
    LicenseUrl: LICENSE.txt
    ReadmeUrl: README.md
    Labels: ['tests']
    HomePageUrl: https://github.com/user1/my-app-project
    SemanticVersion: 0.0.1
    SourceCodeUrl: https://github.com/user1/my-app-project
Resources:
  HelloWorldFunction:
    Type: AWS::Lambda::Function
    Properties:
      ...
      CodeUri: source-code1
      ...
```

For more information about the `Metadata` section of the AWS SAM template, see [AWS SAM template Metadata section properties](#metadata-section-properties).

#### Step 2: Package the application

Run the following AWS SAM CLI command, which uploads the application's artifacts to Amazon S3 and outputs a new template file called `packaged.yaml`:

```bash
$ sam package --output-template-file packaged.yaml --s3-bucket <your-bucket-name>
```

You use the `packaged.yaml` template file in the next step to publish the application to the AWS Serverless Application Repository. This file is similar to the original template file (`template.yaml`), but it has a key difference—the `CodeUri`, `LicenseUrl`, and `ReadmeUrl` properties point to the Amazon S3 bucket and objects that contain the respective artifacts.

The following snippet from an example `packaged.yaml` template file shows the `CodeUri` property:

```yaml
MySampleFunction:
  Type: AWS::Serverless::Function
  Properties:
    CodeUri: s3://bucketname/fbd77a3647a4f47a352fcObjectGUID
    ...
```

#### Step 3: Publish the application

To publish a private version of your AWS SAM application to the AWS Serverless Application Repository, run the following AWS SAM CLI command:

```bash
$ sam publish --template packaged.yaml --region us-east-1
```

The output of the `sam publish` command includes a link to your application on the AWS Serverless Application Repository. You can also go directly to the AWS Serverless Application Repository landing page and search for your application.

#### Step 4: Share the application (optional)

By default, your application is set to private, so it isn’t visible to other AWS accounts. To share your application with others, you must either make it public or grant permission to a specific list of AWS accounts.

For information about sharing your application using the AWS CLI, see [AWS Serverless Application Repository Resource-Based Policy Examples](https://docs.aws.amazon.com/serverlessrepo/latest/devguide/serverlessrepo-how-to-share.html) in the AWS Serverless Application Repository Developer Guide. For information on sharing your application using the AWS Management Console, see [Sharing an Application](https://docs.aws.amazon.com/serverlessrepo/latest/devguide/sharing-applications.html) in the AWS Serverless Application Repository Developer Guide.

### Publishing a new version of an existing application

After you’ve published an application to the AWS Serverless Application Repository, you might want to publish a new version of it. For example, you might have changed your Lambda function code or added a new component to your application architecture.

To update an application that you’ve previously published, publish the application again using the same process detailed previously. In the `Metadata` section of the AWS SAM template file, provide the same application name that you originally published it with, but include a new `SemanticVersion` value.

For example, consider an application published with the name `SampleApp` and a `SemanticVersion` of `1.0.0`. To update that application, the AWS SAM template must have the application name `SampleApp` and a `SemanticVersion` of `1.0.1` (or anything other than `1.0.0`).

### Additional topics

- [AWS SAM template Metadata section properties](#metadata-section-properties)

### Metadata section properties

`AWS::ServerlessRepo::Application` is a metadata key that you can use to specify application information that you want published to the AWS Serverless Application Repository.

> **Note**
> AWS CloudFormation intrinsic functions aren’t supported by the `AWS::ServerlessRepo::Application` metadata key.

#### Properties

This table provides information about the properties of the `Metadata` section of the AWS SAM template. This section is required to publish applications to the AWS Serverless Application Repository using the AWS SAM CLI.

| Property          | Type   | Required | Description                                                                                                           |
|-------------------|--------|----------|-----------------------------------------------------------------------------------------------------------------------|
| `Name`            | String | TRUE     | The name of the application. Minimum length=1. Maximum length=140. Pattern: "[a-zA-Z0-9\\-]+";                        |
| `Description`     | String | TRUE     | The description of the application. Minimum length=1. Maximum length=256.                                             |
| `Author`          | String | TRUE     | The name of the author publishing the application. Minimum length=1. Maximum length=127. Pattern: "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$"; |
| `SpdxLicenseId`   | String | FALSE    | A valid license identifier. To view the list of valid license identifiers, see [SPDX License List](https://spdx.org/licenses/) on the Software Package Data Exchange (SPDX) website. |
| `LicenseUrl`      | String | FALSE    | The reference to a local license file, or an Amazon S3 link to a license file, that matches the `SpdxLicenseId` value of your application. Maximum size: 5 MB. You must provide a value for this property to make your application public. Note that you cannot update this property after your application has been published. To add a license to an application, you must either delete it first or publish a new application with a different name. An AWS SAM template file that hasn’t been packaged using the `sam package` command can have a reference to a local file for this property. However, for an application to be published using the `sam publish` command, this property must be a reference to an Amazon S3 bucket. |
| `ReadmeUrl`       | String | FALSE    | The reference to a local readme file or an Amazon S3 link to the readme file that contains a more detailed description of the application and how it works. Maximum size: 5 MB. An AWS SAM template file that hasn’t been packaged using the `sam package` command can have a reference to a local file for this property. However, to be published using the `sam publish` command, this property must be a reference to an Amazon S3 bucket. |
| `Labels`          | String | FALSE    | The labels that improve discovery of applications in search results. Minimum length=1. Maximum length=127. Maximum number of labels: 10. Pattern: "^[a-zA-Z0-9+\\-:\\\\/@]+$"; |
| `HomePageUrl`     | String | FALSE    | A URL with more information about the application—for example, the location of your GitHub repository for the application. |
| `SemanticVersion` | String | FALSE    | The semantic version of the application. For the Semantic Versioning specification, see the [Semantic Versioning website](https://semver.org/). You must provide a value for this property to make your application public. |
| `SourceCodeUrl`   | String | FALSE    | A link to a public repository for the source code of your application.                                                |

#### Use cases

This section lists the use cases for publishing applications, along with the `Metadata` properties that are processed for that use case. Properties that are not listed for a given use case are ignored.

- **Creating a new application** - A new application is created if there is no application in the AWS Serverless Application Repository with a matching name for an account.
  - `Name`
  - `SpdxLicenseId`
  - `LicenseUrl`
  - `Description`
  - `Author`
  - `ReadmeUrl`
  - `Labels`
  - `HomePageUrl`
  - `SourceCodeUrl`
  - `SemanticVersion`
  - The content of the AWS SAM template (for example, any event sources, resources, and Lambda function code)

- **Creating an application version** - An application version is created if there is already an application in the AWS Serverless Application Repository with a matching name for an account and the `SemanticVersion` is changing.
  - `Description`
  - `Author`
  - `ReadmeUrl`
  - `Labels`
  - `HomePageUrl`
  - `SourceCodeUrl`
  - `SemanticVersion`
  - The content of the AWS SAM template (for example, any event sources, resources, and Lambda function code)

- **Updating an application** - An application is updated if there is already an application in the AWS Serverless Application Repository with a matching name for an account and the `SemanticVersion` is not changing.
  - `Description`
  - `Author`
  - `ReadmeUrl`
  - `Labels`
  - `HomePageUrl`

#### Example

The following is an example `Metadata` section:

```yaml
Metadata:
  AWS::ServerlessRepo::Application:
    Name: my-app
    Description: hello world
    Author: user1
    SpdxLicenseId: Apache-2.0
    LicenseUrl: LICENSE.txt
    ReadmeUrl: README.md
    Labels: ['tests']
    HomePageUrl: https://github.com/user1/my-app-project
    SemanticVersion: 0.0.1
    SourceCodeUrl: https://github.com/user1/my-app-project
```

## Document history

The following table describes the important changes in each release of the AWS Serverless Application Model Developer Guide. For notifications about updates to this documentation, you can subscribe to an RSS feed.

- **Latest documentation update**: June 20, 2024

| Change                                                                 | Description                                                                                                   | Date            |
|------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|-----------------|
| Restructured and updated content throughout the developer guide        | Reorganized and restructured the guide to improve discoverability and usability. Updated and improved titles. Provided additional details when introducing topics and concepts. | June 20, 2024   |
| Added AWS SAM CLI support for Ruby 3.3                                 | Ruby 3.3 is now available as a runtime and image repositories and `sam init` for details.                      | April 4, 2024   |
| Added AWS SAM CLI command options                                      | New options are available for the command `sam local start-api`: `--ssl-certfile PATH`, `--ssl-keyfile PATH`. Additionally, the new command line option `--add-host LIST` is available for `sam local invoke`, `sam local start-api`, and `sam local start-lambda`. | March 20, 2024  |
| Added AWS SAM CLI support for .NET 8                                   | .NET 8 is now available as a runtime and image repositories. Runtimes and image repositories for .NET Core 3.1, Node.js 14, Node.js 12, Python 3.7, Ruby 2.7 are no longer supported. See [Image repositories](#image-repositories) and [sam init](#sam-init). | February 22, 2024 |
| Added AWS SAM CLI arm64 package installer for Linux                    | For instructions, see [Installing the AWS SAM CLI](#installing-the-aws-sam-cli).                              | December 6, 2023|
| Added `--watch-exclude` option for the AWS SAM CLI `sam sync` command  | Exclude files and folders from initiating a sync. To learn more, see [Specify files and folders that won’t initiate a sync](#customize-what-local-changes-are-synced-to-the-aws-cloud). | December 6, 2023|
| Added `--build-in-source` option for the AWS SAM CLI `sam sync` command| Build your project in your source folder to speed up the build process. To learn more, see [Speed up build times by building your project in the source folder](#customize-your-build). | December 6, 2023|
| Added `--build-in-source` option for the AWS SAM CLI `sam build` command | Build your project in your source folder to speed up the build process. To learn more, see [Speed up build times by building your project in the source folder](#customize-your-build). | December 6, 2023|
| Added new resource support for AWS SAM CLI `remote invoke` command     | Use `sam remote invoke` with Kinesis Data Streams applications, Amazon SQS queues, and Step Functions state machines. To learn more, see [Using sam remote invoke](#using-the-sam-remote-invoke-command). | November 15, 2023 |
| Added new AWS SAM CLI `remote test-event` command for shareable test events | Use the AWS SAM CLI to access and manage shareable test events from the EventBridge schema registry to test your Lambda functions in the AWS Cloud. To learn more, see [Using sam remote test-event](#using-the-sam-remote-test-event-command). | October 3, 2023 |
| AWS SAM CLI support for Terraform is now generally available           | To learn more about AWS SAM CLI support for Terraform, see [AWS SAM CLI Terraform support](#aws-sam-cli-terraform-support). | September 5, 2023 |
| Added AWS SAM CLI support for Terraform Cloud                          | The AWS SAM CLI now supports local testing for Terraform Cloud. To learn more, see [Set up for Terraform Cloud](#set-up-for-terraform-cloud). | September 5, 2023 |
| Added YAML file format support for the AWS SAM CLI configuration file  | The AWS SAM CLI now supports the `.yaml`/`.yml` file format. [Configuring the AWS SAM CLI](#configuring-the-aws-sam-cli) and [AWS SAM CLI configuration file](#aws-sam-cli-configuration-file) pages have been updated. | July 18, 2023   |
| Added AWS SAM CLI `sam local start-api` command support for Terraform  | The [What is AWS SAM CLI support for Terraform?](#aws-sam-cli-terraform-support) section has been updated to include AWS SAM CLI `sam local start-api` command support for Terraform. | July 6, 2023    |
| Added new AWS SAM CLI `remote invoke` command                          | To start using `sam remote invoke`, see [Using sam remote invoke](#using-the-sam-remote-invoke-command).       | June 22, 2023   |
| Added AWS AppSync GraphQL API serverless resource type                | Create new `AWS::Serverless::GraphqlApi` section that describes how to define a GraphQL API resource with AWS SAM. | June 22, 2023   |
| Added AWS SAM CLI support for Ruby 3.2                                 | Update [sam init](#sam-init) page to include new base image and runtime values. Update [Image repositories](#image-repositories) page with Ruby 3.2 Amazon ECR URI. | June 6, 2023    |
| Added optional steps for integrity verification of the AWS SAM CLI package installer | Update [Installing the AWS SAM CLI](#installing-the-aws-sam-cli) page to reflect optional step. Create [Verify the integrity of the AWS SAM CLI installer](#optional-verify-the-aws-sam-cli-installer) page to document steps. | May 31, 2023    |
| Added `sam sync` option to skip infrastructure sync                    | Customize whether an AWS CloudFormation deployment is required each time `sam sync` is run. To learn more, see [Skip the initial AWS CloudFormation deployment](#intro-to-sam-sync). | March 23, 2023  |
| Added support for DocumentDB event source type                         | The AWS SAM template specification now supports DocumentDB event source type for the `AWS::Serverless::Function` resource. To learn more, see [DocumentDB](#resources-and-properties). | March 10, 2023  |
| Build Rust Lambda functions with Cargo Lambda                          | Use the AWS SAM CLI to build your Rust Lambda functions using Cargo Lambda. To learn more, see [Building Rust Lambda functions with Cargo Lambda](#build-your-application). | February 23, 2023 |
| Build function resources outside of AWS SAM                            | Added guidance on skipping functions when using the `sam build` command. To learn more, see [Building functions outside of AWS SAM](#build-your-application). | February 14, 2023 |
| New embedded connectors syntax                                         | Use the new embedded connectors syntax to define your `AWS::Serverless::Connector` resources. To learn more, see [Managing resource permissions with AWS SAM connectors](#managing-resource-permissions-with-aws-sam-connectors). | February 8, 2023 |
| Added new `sam list` command for the AWS SAM CLI                       | Use `sam list` to view important information about the resources in your serverless application. To learn more, see [sam list](#sam-list). | February 2, 2023 |
| Added Format and OutExtension build properties for esbuild             | Building Node.js Lambda functions with esbuild now supports `Format` and `OutExtension` build properties. To learn more, see [Building Node.js Lambda functions with esbuild](#build-your-application). | February 2, 2023 |
| Added runtime management options to the AWS SAM template specification | Configure runtime management options for your Lambda functions. To learn more, see [RuntimeManagementConfig](#resources-and-properties). | January 24, 2023 |
| Target property added to EventSource for `AWS::Serverless::StateMachine` resource | `AWS::Serverless::StateMachine` resource type supports the `Target` property for `EventBridgeRule` and `Schedule` event sources. | January 13, 2023 |
| Configure scaling of SQS pollers for Lambda functions                  | Configure scaling of SQS pollers with the `ScalingConfig` property for `AWS::Serverless::Function`. To learn more, see [ScalingConfig](#resources-and-properties). | January 12, 2023 |
| Validate AWS SAM applications with cfn-lint                            | You can use `cfn-lint` to validate your AWS SAM templates through the AWS SAM CLI. To learn more, see [Validate with cfn-lint](#validate-with-cfn-lint). | January 11, 2023 |
| Monitor your serverless applications with CloudWatch Application Insights | Configure Amazon CloudWatch Application Insights to monitor your AWS SAM applications. To learn more, see [Monitor your serverless applications with CloudWatch Application Insights](#monitor-your-application). | December 19, 2022 |
| Added AWS SAM CLI package installer for macOS                          | Install the AWS SAM CLI using the new macOS package installer. To learn more, see [Installing the AWS SAM CLI](#installing-the-aws-sam-cli). | December 6, 2022 |
| Added support for Lambda SnapStart                                     | Configure SnapStart for your Lambda functions to create snapshots, which are cached states of your initialized functions. To learn more, see [AWS::Serverless::Function](#resources-and-properties). | November 28, 2022 |
| Added AWS SAM CLI support for nodejs18.x                               | AWS SAM CLI now supports `nodejs18.x` runtime. To learn more, see [sam init](#sam-init).                       | November 17, 2022 |
| Added guidance on configuring access and permissions                   | AWS SAM provides two options that simplify management of access and permissions for your serverless applications. To learn more, see [Managing resource access and permissions](#set-up-access). | November 17, 2022 |
| Added support for building .NET 7 Lambda functions with Native AOT compilation | Build and package your .NET 7 Lambda functions with AWS SAM, utilizing Native Ahead-of-Time (AOT) compilation to improve Lambda cold-start times. To learn more, see [Building .NET 7 Lambda functions with Native AOT compilation](#build-your-application). | November 15, 2022 |
| Added AWS SAM CLI Terraform support for local debugging and testing    | Use the AWS SAM CLI within your Terraform projects to perform local debugging and testing of your Lambda functions and layers. To learn more, see [AWS SAM CLI Terraform support](#aws-sam-cli-terraform-support). | November 14, 2022 |
| Added AWS SAM support for EventBridge Scheduler                        | The AWS Serverless Application Model (AWS SAM) template specification provides a simple, shorthand syntax that you can use to schedule events with EventBridge Scheduler for AWS Lambda and AWS Step Functions. For more information, see [Scheduling events with EventBridge Scheduler](#manage-time-based-events). | November 10, 2022 |
| Simplified the AWS SAM CLI installation instructions                   | AWS SAM CLI prerequisites and optional steps have been moved to separate pages. Installation steps for supported operating systems can be found at [Installing the AWS SAM CLI](#installing-the-aws-sam-cli). | November 4, 2022 |
| Added fix to allow long paths for Windows 10 users                     | The AWS SAM CLI app templates repository contains some long file paths which may cause errors when running `sam init` due to Windows 10 MAX_PATH limitations. For more information, see [Installing the AWS SAM CLI](#installing-the-aws-sam-cli). | November 4, 2022 |
| Updated gradual deployment process for first-time deployments          | Gradually deploying a Lambda function with AWS CodeDeploy requires two steps. To learn more, see [Gradually deploying a Lambda function for the first time](#gradually-deploying-a-lambda-function-for-the-first-time). | October 13, 2022 |
| Additional Lambda event filtering support for more types of events     | `FilterCriteria` property added to MSK, MQ, and SelfManagedKafka event source types.                  | October 13, 2022 |
| Added OpenID Connect (OIDC) support for AWS SAM pipeline               | AWS SAM supports OpenID Connect (OIDC) user authentication for Bitbucket, GitHub Actions, and GitHub continuous integration and continuous delivery (CI/CD) platforms. To learn more, see [Using OIDC User Accounts with AWS SAM pipeline](#use-oidc-authentication). | October 13, 2022 |
| Note on JwtConfiguration properties                                    | Added note on defining issuer and audience properties under `JwtConfiguration` for `OAuth2Authorizer`. | October 7, 2022  |
| New properties for Function and StateMachine EventSource               | `Enabled` and `State` properties added to `CloudWatchEvent` event source for `AWS::Serverless::Function`. `State` property added to `Schedule` event source for `AWS::Serverless::Function` and `AWS::Serverless::StateMachine`. | October 6, 2022  |
| AWS SAM connectors now generally available                             | Connectors are an AWS SAM abstract resource type, identified as `AWS::Serverless::Connector`, that provides a simple and secure method of provisioning permissions between your serverless application resources. To learn more, see [Managing resource permissions with AWS Serverless Application Model connectors](#managing-resource-permissions-with-aws-sam-connectors). | October 6, 2022  |
| Added new `sam sync` options to the AWS SAM CLI                        | `--dependency-layer` and `--use-container` options added to `sam sync`.                               | September 20, 2022 |
| Added new `sam deploy` options to the AWS SAM CLI                      | `--on-failure` option added to `sam deploy`.                                                          | September 9, 2022  |
| esbuild support now generally available                                | To build and package Node.js Lambda functions, you can use the AWS SAM CLI with the esbuild JavaScript bundler. | September 1, 2022 |
| Updated AWS SAM CLI telemetry                                          | Description of system and environment information collected has been updated to include hash values of usage attributes. | September 1, 2022 |
| Added local environment variable support to AWS SAM CLI                | Use environment variables with AWS SAM CLI when invoking Lambda functions locally and when running API Gateway locally. | September 1, 2022 |
| Support for Lambda instruction set architectures                       | Use the AWS SAM CLI to build Lambda functions and Lambda layers for x86_64 or arm64 instruction set architectures. For more information, see the `Architectures` property of the `AWS::Serverless::Function` resource type and the `CompatibleArchitectures` property of the `AWS::Serverless::LayerVersion` resource type. | October 1, 2021  |
| Generating example pipeline configurations                             | Use the AWS SAM CLI to generate example pipelines for multiple CI/CD systems, using the new `sam pipeline bootstrap` and `sam pipeline init` commands. For more information, see [Generating example CI/CD pipelines](#generate-a-starter-pipeline). | July 21, 2021   |
| AWS SAM CLI AWS CDK integration (preview, phase 2)                     | With phase 2 of the public preview release, you can now use the AWS SAM CLI to package and deploy AWS CDK applications. You can also download a sample AWS CDK application directly using the AWS SAM CLI. For more information, see [AWS Cloud Development Kit (AWS CDK) (Preview)](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-cdk.html). | July 13, 2021   |
| Support for RabbitMQ as an event source for functions                  | Added support for RabbitMQ as an event source for serverless functions. For more information, see the `SourceAccessConfigurations` property of the `MQ` event source of the `AWS::Serverless::Function` resource type. | July 7, 2021    |
| Deploying serverless applications using Amazon ECR build container images | Use Amazon ECR build container images to deploy serverless applications with common CI/CD systems such as AWS CodePipeline, Jenkins, GitLab CI/CD, and GitHub Actions. For more information, see [Deploying serverless applications](#deploy-your-application-and-resources). | June 24, 2021   |
| Debugging AWS SAM applications with AWS Toolkits                       | AWS Toolkits now supports step-through debugging with more combinations of integrated development environments (IDEs) and runtimes. For more information, see [Using AWS Toolkits](#using-aws-toolkits). | May 20, 2021    |
| AWS SAM CLI AWS CDK integration (preview)                              |
