using System;

namespace GMVC.Models.DB_Objects
{
    public class User
    {
        public User(string ID, string Name, string UserName){
            this.ID = ID;
            this.Name = Name;
            this.UserName = UserName;
        }
        public string ID {get;set;}
        public string Name {get;set;}
        public string UserName{get;set;}
    }
}