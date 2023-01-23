table 50001 DemoTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "SNO."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; CustName; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
    }

    keys
    {
        key(Key1; "SNO.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}