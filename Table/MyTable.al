table 50023 MyTable
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"No."; Integer)
        {
            DataClassification = ToBeClassified;
            
        }
        field(2;Name;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Address"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Address2"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
         field(5; "Address3"; Text[250])
        {
            DataClassification = ToBeClassified;
        }


    }
    
    keys
    {
        key(Key1; MyField)
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
