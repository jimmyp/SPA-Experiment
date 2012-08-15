using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AU.SPA.MC
{
    public class Page1Controller
    {
        //public Page1View GetModel(){}
        public string GetModel()
        {
            return "{ \"title\": \"My New Post\", \"body\": \"This is my first post!\" }";
        }
    }

    public class Page1View
    {
        
    }
}
