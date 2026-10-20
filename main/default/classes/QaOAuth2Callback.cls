public with sharing class QaOAuth2Callback {
    public static void fail(Integer statusCode, String marker, String summarySuffix, Integer bodyPadding) {
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setEndpoint('https://qa3007.example.com/call');
        req.setBody('{"marker":"' + marker + '"}');
        HttpResponse res = new HttpResponse();
        res.setStatusCode(statusCode);
        res.setBody('<html><marker>' + marker + '</marker>' + 'x'.repeat(bodyPadding) + '</html>');
        TritonBuilder log = Triton.makeBuilder()
            .type(TritonTypes.Type.Backend)
            .area(TritonTypes.Area.RestAPI)
            .summary('QA3007 callout failed' + summarySuffix)
            .details('QA3007 marker ' + marker)
            .integrationPayload(req, res)
            .error();
        Triton.logNow(log);
    }
}