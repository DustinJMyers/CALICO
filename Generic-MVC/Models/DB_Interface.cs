using System;
using System.Collections.Generic;
using Npgsql;

namespace GMVC.Models
{
    public class DB_Interface
    {
        private NpgsqlConnection _conn;
        
        public DB_Interface(){
            LoadConnString(
                "Host=127.0.0.1;Username=postgres;Password=postgres;"
            );
        }
        public DB_Interface(string connection_string){
            LoadConnString(connection_string);
        }
        public bool LoadConnString(string connection_string){
            try{
                _conn = new NpgsqlConnection(connection_string);
            }
            catch{
                return false;
            }
            return true;
        }
        public bool CanOpen(){
            try{
                _conn.Open();
                _conn.Close();
            }
            catch{
                return false;
            }
            return true;
        }
        public NpgsqlCommand MakeCommand(string command){
            NpgsqlCommand cmd = new NpgsqlCommand();
            try{
                cmd = new NpgsqlCommand(command, _conn);
            }
            catch{
                
            }
            return cmd;
        }
        public string Test(){
            _conn.Open();
            NpgsqlCommand cmd = MakeCommand("SELECT 1");
            NpgsqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            string str = reader.GetString(1);
            _conn.Close();
            return str;
        }
        public List<List<string>> MakeQuery(NpgsqlCommand cmd){
            List<List<string>> returned;
            try{
                _conn.Open();
                NpgsqlDataReader reader = cmd.ExecuteReader();
                returned = Command2Table(reader);
                _conn.Close();
            }
            catch{
                returned = new List<List<string>>();
            }
            return returned;
        }


        public string Field2String(NpgsqlDataReader dr, int i){
            try{
                switch(dr.GetFieldType(i).ToString()){
                    
                    default:
                        return (string)dr.GetValue(i);
                }
            }
            catch{
                return dr.GetFieldType(i).ToString();
            }
            
        }
        public List<string> Command2List(NpgsqlDataReader dr){
            List<string> returned = new List<string>();
            for(int i = 0; i < dr.FieldCount; i++){
                returned.Add(Field2String(dr,i));
            }
            return returned;
        }
        public List<List<string>> Command2Table(NpgsqlDataReader dr){
            List<List<string>> returned = new List<List<string>>();
            while(dr.Read()){
                returned.Add(Command2List(dr));
            }
            return returned;
        }

    }
}