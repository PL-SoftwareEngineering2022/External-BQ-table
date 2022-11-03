CREATE SCHEMA `company-warehouse-dev`.stp
OPTIONS (
    description = "dataset for the creation of the permanent BQ table",
    location = "US",
    default_table_expiration_ms = "3600000",
    labels = [("env", "dev"), ("label2", "value2")]
);


CREATE EXTERNAL TABLE `company-warehouse-dev.stp`.warehouse_bq
OPTIONS (
    format = "CLOUD_BIGTABLE",
    uris = ['https://googleapis.com/bigtable/projects/company-project-dev/instances/personstore/tables/personidlookup'],
    bigtable_options = 
    """
    {
        bigtableColumnFamilies : [
            {
                "familyId" : "familyName1",
                "type" : "STRING"
            },
            {
                "familyId" : "familyName2",
                "type" : "STRING"
            },
            {
                "familyId" : "familyName3",
                "type" : "STRING"
            }
        ],
        "readRowkeyAsString" : true,
        "ignoreUnspecifiedColumnFamilies" : true
    }
    """
);