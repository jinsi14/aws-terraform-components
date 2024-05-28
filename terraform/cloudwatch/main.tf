terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Adjust the version to match your locked version
    }
  }
}

provider "aws" {
  region = var.aws_region
}


resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = var.dashboard_name

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 6
        height = 6

        properties = {
          metrics = [
            [
              "AWS/Connect",
              "ContactFlowErrors",
              "InstanceId",
              var.instance_id,
              "ContactFlowName",
              var.contact_flow_name1,
              "MetricGroup",
              "ContactFlow"
            ]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "AmazonConnectInstance: ToInstancePacketLossRate"
          view   = "timeSeries"
        }
      },
      {
        type   = "metric"
        x      = 6
        y      = 0
        width  = 6
        height = 6

        properties = {
          metrics = [
            [
              "AWS/Connect",
              "LongestQueueWaitTime",
              "InstanceId",
              var.instance_id,
              "QueueName",
              var.queue_name1,
              "MetricGroup",
              "Queue"
            ],
            [
              "AWS/Connect",
              "LongestQueueWaitTime",
              "InstanceId",
              var.instance_id,
              "QueueName",
              var.queue_name2,
              "MetricGroup",
              "Queue"
            ],
            [
              "AWS/Connect",
              "QueueSize",
              "InstanceId",
              var.instance_id,
              "QueueName",
              var.queue_name1,
              "MetricGroup",
              "Queue"
            ],
            [
              "AWS/Connect",
              "QueueSize",
              "InstanceId",
              var.instance_id,
              "QueueName",
              var.queue_name2,
              "MetricGroup",
              "Queue"
            ],
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "ContactFlow & Queues: ContactFlowErrors, LongestQueueWaitTime, QueueSize"
          view   = "timeSeries"
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 6
        height = 6

        properties = {
          metrics = [
            [
              "AWS/DynamoDB",
              "ConsumedWriteCapacityUnits",
              "TableName",
              var.table_name1,
              "Region",
              var.aws_region
            ],
            [
              "AWS/DynamoDB",
              "ConsumedReadCapacityUnits",
              "TableName",
              var.table_name1,
              "Region",
              var.aws_region
            ],
            [
              "AWS/DynamoDB",
              "ConsumedWriteCapacityUnits",
              "TableName",
              var.table_name2,
              "Region",
              var.aws_region
            ],
            [
              "AWS/DynamoDB",
              "ConsumedReadCapacityUnits",
              "TableName",
              var.table_name2,
              "Region",
              var.aws_region
            ],
            [
              "AWS/DynamoDB",
              "ProvisionedReadCapacityUnits",
              "TableName",
              var.table_name2,
              "Region",
              var.aws_region
            ],
            [
              "AWS/DynamoDB",
              "ProvisionedWriteCapacityUnits",
              "TableName",
              var.table_name2,
              "Region",
              var.aws_region
            ],
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "Dynomodb: ConsumedReadCapacityUnits, ConsumedWriteCapacityUnits, ProvisionedReadCapacityUnits, ProvisionedWriteCapacityUnits"
          view   = "bar"
        }
      },
      {
        type   = "metric"
        x      = 18
        y      = 0
        width  = 6
        height = 6

        properties = {
          metrics = [
            [
              "AWS/Firehose",
              "DataReadFromKinesisStream.Records",
              "DeliveryStreamName",
              var.delivery_stream_name
            ],
            [
              "AWS/Firehose",
              "ThrottledGetRecords",
              "DeliveryStreamName",
              var.delivery_stream_name
            ],
            [
              "AWS/Firehose",
              "KinesisMillisBehindLatest",
              "DeliveryStreamName",
              var.delivery_stream_name
            ]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "Firehose: DataReadFromKinesisStream.Records, KinesisMillisBehindLatest, ThrottledGetRecords"
          view   = "bar"
        }
      },
      {
        type   = "metric"
        x      = 0
        y      = 7
        width  = 6
        height = 6

        properties = {
          metrics = [
            [
              "AWS/Kinesis",
              "OutgoingBytes",
              "StreamName",
              var.stream_name1
            ],
            [
              "AWS/Kinesis",
              "IncomingBytes",
              "StreamName",
              var.stream_name1
            ],
            [
              "AWS/Kinesis",
              "GetRecords.Bytes",
              "StreamName",
              var.stream_name2
            ],
            [
              "AWS/Kinesis",
              "GetRecords.Success",
              "StreamName",
              var.stream_name2
            ],
            [
              "AWS/Kinesis",
              "IncomingBytes",
              "StreamName",
              var.stream_name2
            ],
            [
              "AWS/Kinesis",
              "PutRecord.Success",
              "StreamName",
              var.stream_name2
            ]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "Kinesis: GetRecords.Bytes, GetRecords.Success, IncomingBytes, OutgoingBytes"
          view   = "bar"
        }
      },
      {
        type   = "metric"
        x      = 6
        y      = 7
        width  = 6
        height = 6

        properties = {
          metrics = [
            [
              "AWS/Lambda",
              "Invocations",
              "FunctionName",
              var.lambda_function_name1
            ],
            [
              "AWS/Lambda",
              "Errors",
              "FunctionName",
              var.lambda_function_name1
            ],
            [
              "AWS/Lambda",
              "Duration",
              "FunctionName",
              var.lambda_function_name1
            ],
            [
              "AWS/Lambda",
              "Throttles",
              "FunctionName",
              var.lambda_function_name1
            ],
            [
              "AWS/Lambda",
              "Invocations",
              "FunctionName",
              var.lambda_function_name2
            ],
            [
              "AWS/Lambda",
              "Errors",
              "FunctionName",
              var.lambda_function_name2
            ],
            [
              "AWS/Lambda",
              "Duration",
              "FunctionName",
              var.lambda_function_name2
            ],
            [
              "AWS/Lambda",
              "Throttles",
              "FunctionName",
              var.lambda_function_name2
            ]
          ]
          period = 300
          stat   = "Average"
          region = "us-east-1"
          title  = "Lambda: Invocations, Errors, Duration, Throttles"
          view   = "bar"
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 7
        width  = 6
        height = 6

        properties = {
          metrics = [
            
            [
              "AWS/RDS",
              "ACUUtilization",
              "DBInstanceIdentifier",
              var.db_instance_identifier,
              "DBClusterIdentifier",
              var.db_cluster_identifier,
            ],
            [
              "AWS/RDS",
              "CPUUtilization",
              "DBInstanceIdentifier",
              var.db_instance_identifier,
              "DBClusterIdentifier",
              var.db_cluster_identifier,
            ],
            [
              "AWS/RDS",
              "WriteLatency",
              "DBInstanceIdentifier",
              var.db_instance_identifier,
              "DBClusterIdentifier",
              var.db_cluster_identifier,
            ],
             [
              "AWS/RDS",
              "ReadLatency",
              "DBInstanceIdentifier",
              var.db_instance_identifier,
              "DBClusterIdentifier",
              var.db_cluster_identifier,
            ],
            [
              "AWS/RDS",
              "ServerlessDatabaseCapacity",
              "DBInstanceIdentifier",
              var.db_instance_identifier
            ]
           
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "RDS Read/Write IOPS"
          view   = "bar"
        }
      }
    ]
  })
}
