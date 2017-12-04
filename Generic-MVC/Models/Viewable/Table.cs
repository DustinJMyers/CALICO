using System;
using System.Collections.Generic;

namespace GMVC.Models.Viewable
{
    public 
    class Table
    {
        public Table(){
            Show_Tools = true;
            Headers = new List<string>();
            Content = new List<List<string>>();

        }
        public string Name {get;set;}
        public List<string> Headers {get;set;}
        public List<List<string>> Content{get;set;}
        public bool Show_Tools{get;set;}
    }
}