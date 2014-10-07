%hook WFWebController

- (void)webViewDidFinishLoad:(UIWebView *)webView  
{
	%orig;

    NSURLRequest *request = webView.request;
    NSString *urlstring = request.URL.absoluteString;
    
    if (!webView.isLoading && ([urlstring rangeOfString:@"mapi.miliyo.com/home/index"].location != NSNotFound)) {
        
        
         NSString *output = [webView stringByEvaluatingJavaScriptFromString:@"function f()"
                            "{"
                            "var arr = document.getElementsByClassName('digest')[0].children;"
                            "for(var i=0; i < arr.length; i++)"
                            "{"
								"var element = arr[i];"	
								"element.setAttribute('onclick', element.getAttribute('onclick').replace(/1,/, '0,'));"
								"element.innerHTML = element.innerHTML.replace('<i class=\"mask\"></i>', '');"
                            "}"

                            "return string;"
                            "}f()"];

        [webView stringByEvaluatingJavaScriptFromString:@"is_cansee_contact = 1"];
        
 		NSLog(@"%@", output);
        
    }
}

%end 