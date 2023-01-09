import ballerina/http;
import ballerina/url;
import ballerina/io;

type AccessToken record {
    string token;
};

service / on new http:Listener (9090) {

    resource function post token (@http:Payload string tokenRequest) returns AccessToken | error?{
        string decoded = check url:decode(tokenRequest, "UTF-8");
        io:println("URL decoded value: ", decoded);

        AccessToken token = {token: "abc"};
        return token;
    }
}