codeunit 50002 "Try Functions"
{
    
    var
        NotEqualErr: label 'Values must be equal';

    trigger OnRun()
    begin
        if not TryCompareIntegers(6, 5) then
            Message('Try Failed');

        if not TryCompareIntegersMulti(6, 5) then
            Message('Try Multi Failed');

        CompareIntegers(6, 5); // <----<<<< Errors here
    end;

    local procedure CompareIntegers(arg1: Integer; arg2: Integer)
    begin
        if (arg1 <> arg2) then
            Error(NotEqualErr);
    end;

    [TryFunction]
    local procedure TryCompareIntegers(arg1: Integer; arg2: Integer)
    begin
        if (arg1 <> arg2) then
            Error(NotEqualErr);
    end;

    [TryFunction]
    local procedure TryCompareIntegersMulti(arg1: Integer; arg2: Integer)
    begin
        CompareIntegers(arg1, arg2);
    end;
}
