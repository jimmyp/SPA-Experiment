using System;
using System.Web.UI;

namespace AU.SPA.Webforms.Page1
{
    public partial class Json : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(@"{ 
                                ""title"": ""My New Post"", 
                                ""body"": ""This is my first post!"",
                                ""next"" : ""Page2""
                            }");
            Response.ContentType = "application/json";

        }
    }
}