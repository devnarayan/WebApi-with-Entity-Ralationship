using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebserviceApi.DataModel;
using WebserviceApi.Data.Access.Webservices;



namespace Webservice.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Student()
        {
            return View();
        }

        public string GetstudentInfo()
        
        
        {
            StudentServices objservices = new StudentServices();
            var stmdl= objservices.Allstudent();
            return Newtonsoft.Json.JsonConvert.SerializeObject(stmdl);
        }
        public string GetsubjectInfo(int Studentid)
        {
            StudentServices objservices = new StudentServices();
            var stmdl = objservices.Allstubjectbystudent(Studentid);
            return Newtonsoft.Json.JsonConvert.SerializeObject(stmdl);
        }

        public string AddSubjectInfo(int subjectId, int studentId)
        {
            StudentServices objservices = new StudentServices();
            SubjectDetailModel objmdl=new SubjectDetailModel();
            objmdl.StudentId=studentId;
            objmdl.SubjectId=subjectId;
            objservices.AddsubjectDetail(objmdl);
            var stmdl = objservices.Getrecord(studentId, subjectId);
          return Newtonsoft.Json.JsonConvert.SerializeObject(stmdl);
        }
        public string RemoveRecord(int Id)
        {
            StudentServices objservices = new StudentServices();
            SubjectDetailModel objmdl=new SubjectDetailModel();
            objmdl.Id=Id;
            var stmdl = objservices.DeleteRecord(objmdl);
            return Newtonsoft.Json.JsonConvert.SerializeObject(stmdl);
        }
    }
}