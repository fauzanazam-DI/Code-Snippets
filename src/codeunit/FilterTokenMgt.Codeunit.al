codeunit 50001 "Filter Token Mgt."
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Filter Tokens", 'OnResolveTextFilterToken', '', true, true)]
    local procedure OnResolveTextFilterToken(TextToken: Text; var TextFilter: Text; var Handled: Boolean)
    var
        Customer: Record Customer;
        MaxCount: Integer;
    begin
        if StrLen(TextToken) < 3 then exit;
        if StrPos(UpperCase('USCUSTOMERS'), UpperCase(TextToken)) = 0 then exit;
        Handled := true;
        MaxCount := 200;
        Customer.SetRange("Country/Region Code", 'US');

        if Customer.FindSet() then begin
            MaxCount -= 1;
            TextFilter := Customer."No.";

            if Customer.Next() <> 0 then
                repeat
                    MaxCount -= 1;
                    TextFilter += '|' + Customer."No.";
                until (Customer.Next() = 0) or (MaxCount <= 0);
        end;
    end;
}
