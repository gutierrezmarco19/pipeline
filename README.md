# pipeline
Example of pipeLine Marco Gutierrez

Notes:
In this project, I developed a solution locally using a Jupyter notebook. Components:

Database:
I used PostgreSQL with the PostGIS extension to handle geospatial data, as the API provides coordinates, and future use cases may require spatial queries.
In this case I need have the JDBC jar in a locally file. (postgresql-42.7.4). The table will be created in the public schema.

Data Processing:
I used PySpark to handle data fetched from an API endpoint. because the volume of data is unknown I prefeer use PySpark.

Real-World Scenario:

For a production implementation, the solution would be migrated to AWS Glue for ETL operations. The notebook would be converted into a Glue job, which could be triggered via AWS Lambda.
Lambda functions could be parameterized to handle inputs such as station_id, It is a good practice to be more adaptative the code.
Scheduling of this process would be managed through Amazon EventBridge.

Pipeline and Queries:
The pipeline-Marco-Gutierrez file contains the logic for data extraction, transformation, and loading (ETL).
The queries-Marco-Gutierrez.sql file includes SQL queries for generating metrics.
