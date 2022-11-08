CREATE SCHEMA `company-warehouse-dev`.stp
OPTIONS (
    description = "dataset for the creation of the permanent BQ table",
    location = "US",
    default_table_expiration_ms = "3600000",
    labels = [("env", "dev"), ("label2", "value2")]
);

// on the CLI:
bq mk --external_table_definition=definition.json --project_id=company-warehouse-dev stp.warehouse_bq

// definition.json:
{
    "sourceFormat": "BIGTABLE",
    "sourceUris": [
        "https://googleapis.com/bigtable/projects/company-platform-dev/instances/personstore/tables/personidlookup"
    ],
    "autodetect": false,
    "bigtableOptions": {
        "columnFamilies" : [
            {
                "familyId": "crm",
                "type" : "STRING" 
            },
            {
                "familyId": "spid",
                "type" : "STRING" 
            },
            {
                "familyId": "pro",
                "type" : "STRING" 
            },
            {
                "familyId": "src",
                "type" : "STRING" 
            }
        ],
        "readRowkeyAsString" : true,
        "ignoreUnspecifiedColumnFamilies": true
    }
}
