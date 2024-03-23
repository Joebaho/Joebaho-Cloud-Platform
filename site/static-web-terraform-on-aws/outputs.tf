output "websiteendpoint" {
    description = "value of the url of the web site"
    value = aws_s3_bucket_website_configuration.static-web-config.website_endpoint
  
}