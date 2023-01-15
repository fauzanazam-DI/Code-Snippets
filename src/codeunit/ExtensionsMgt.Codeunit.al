codeunit 50000 "Extensions Mgt."
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

    internal procedure JsonObjectValuesToDictionary(JObject: JsonObject; ObjectDictionary: Dictionary of [Text, Text])
    var
        IsHandled: Boolean;
        JsonToken: JsonToken;
        DulpicateKeyErr: Label 'Duplicate key %1', Comment = '%1 Key Name';
        ObjectKeys: List of [Text];
        JKey: Text;
        JValue: Text;
    begin
        //OnBeforeJsonObjectValuesToDictionary(JObject, ObjectDictionary, IsHandled);
        if IsHandled then
            exit;

        ObjectKeys := JObject.Keys();
        foreach JKey in ObjectKeys do begin
            JObject.Get(JKey, JsonToken);
            if JsonToken.IsValue then
                if ObjectDictionary.ContainsKey(JKey) then
                    Error(DulpicateKeyErr, JKey);
            JsonToken.WriteTo(JValue);
            ObjectDictionary.Add(JKey, JValue);
        end;
        
        //OnAfterJsonObjectValuesToDictionary(JObject, ObjectDictionary, IsHandled);
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
