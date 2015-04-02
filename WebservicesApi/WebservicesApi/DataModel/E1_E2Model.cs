using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebserviceApi.DataModel
{
    public class E1_E2Model
    {
        public int Id { get; set; }
        public int E1ID { get; set; }
        public int E2ID { get; set; }
        public string E1Name { get; set; }
        public string E2Name { get; set; }

        //public int Id { get; set; }
        //public Nullable<int> StudentId { get; set; }
        //public Nullable<int> SubjectId { get; set; }
        //public string StudentName { get; set; }
        //public string SubjectName { get; set; }
    }
}