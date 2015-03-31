using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebserviceApi.DataModel
{
    public class SubjectModel
    {
        public int SubjectId { get; set; }
        public Nullable<int> StudentId { get; set; }
        public string SubjectName { get; set; }
    }
}