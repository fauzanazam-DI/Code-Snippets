codeunit 50000 "Extensions Mgt."
{

    local procedure GetPostingDate() PostingDate: Date
    begin
        // AL date assignment format is yyyymmddD
        PostingDate := 20230121D;
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
}