/// <summary>
/// Table Project (ID 50100).
/// </summary>
table 50100 Project
{
    Caption = 'Project';
    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; CustomerCode; code[20])
        {
            Caption = 'Customer Code';
            TableRelation = "Customer";
        }
        field(4; "Project Amount"; Decimal)
        {
            Caption = 'Project Amount';
            trigger OnValidate()
            begin
                ComissionAmount := CalculateComissionAmount("Project Amount", "Commision Percnt");
            end;
        }
        field(5; "Commision Percnt"; Decimal)
        {
            Caption = 'Commission %';
            trigger OnValidate()
            begin
                if "Commision Percnt" > 100 then
                    Error('Comission Percent should be less than 100');
                ComissionAmount := CalculateComissionAmount("Project Amount", "Commision Percnt");
            end;
        }
        field(6; ComissionAmount; Decimal)
        {
            Caption = ' Comission Amount';
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    /// <summary>
    /// CalculateComissionAmount.
    /// </summary>
    /// <param name="ProjectAmount">Decimal.</param>
    /// <param name="ComissionPercent">Decimal.</param>
    /// <returns>Return value of type Decimal.</returns>
    procedure CalculateComissionAmount(ProjectAmount: Decimal; ComissionPercent: Decimal): Decimal
    var
        Result: Decimal;
    begin
        if (ProjectAmount <> 0) and (ComissionPercent <> 0) then begin
            Result := (ProjectAmount * ComissionPercent) / 100
        end else begin
            Result := 0;
        end;
        exit(Result);
    end;

    /// <summary>
    /// PrintResult.
    /// </summary>
    /// <param name="ProjectAmount">Decimal.</param>
    /// <param name="ComissionPercent">Decimal.</param>
    /// <param name="Result">Decimal.</param>
    procedure PrintResult(ProjectAmount: Decimal; ComissionPercent: Decimal; Result: Decimal)
    begin
        Message('Result of (%1 and %2) is %3', ProjectAmount, ComissionPercent, Result);
    end;
}