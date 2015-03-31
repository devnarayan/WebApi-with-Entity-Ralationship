using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebserviceApi.DataModel
{
    public class SubjectDetailModel
    {
        public int Id { get; set; }
        public Nullable<int> StudentId { get; set; }
        public Nullable<int> SubjectId { get; set; }
        public string StudentName { get; set; }
        public string SubjectName { get; set; }
    }
}