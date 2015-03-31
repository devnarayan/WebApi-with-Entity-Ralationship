using AutoMapper;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebserviceApi.DataModel;
using WebservicesApi;



namespace WebserviceApi.Data.Access.Webservices
{
    public interface IStudentService
    {
        List<StudentModel> Allstudent();

    }
    public class StudentServices : IStudentService
    {

        public int AddsubjectDetail(SubjectDetailModel ObjSubject)
        {
            try
            {
                using (TestApi_DbEntities contex = new TestApi_DbEntities())
                {
                    Mapper.CreateMap<SubjectDetailModel, SubjectDetail>();
                    var stmdl = Mapper.Map<SubjectDetailModel, SubjectDetail>(ObjSubject);
                    contex.SubjectDetails.Add(stmdl);
                    int i = contex.SaveChanges();
                    return i;

                };

            }
            catch (Exception ex)
            {
                               
                return 0;
            }

        }

        public List<StudentModel> Allstudent()
        {
            List<StudentModel> stsmdl = new List<StudentModel>();
            using (TestApi_DbEntities contex = new TestApi_DbEntities())
            {
                var studentsAll = contex.Studenttables.ToList();
                foreach (var std in studentsAll)
                {
                    Mapper.CreateMap<Studenttable, StudentModel>();
                    var mdlstd = Mapper.Map<Studenttable, StudentModel>(std);
                    stsmdl.Add(mdlstd);

                }
            }
            return stsmdl;
        }

        public List<SubjectModel> Allstubjectbystudent(int studentid)
        {
            List<SubjectModel> stbmdl = new List<SubjectModel>();
            using (TestApi_DbEntities contex = new TestApi_DbEntities())
            {
                var stsAll = contex.Subjecttables.Where(e => e.StudentId == studentid).ToList();
                foreach (var std in stsAll)
                {
                    Mapper.CreateMap<Subjecttable, SubjectModel>();
                    var mdlstd = Mapper.Map<Subjecttable, SubjectModel>(std);
                    stbmdl.Add(mdlstd);

                }
            }
            return stbmdl;
        }

        public List<SubjectDetailModel> Getrecord(int studentid, int subjectid)
        {
           
            List<SubjectDetailModel> stmdl = new List<SubjectDetailModel>();
            TestApi_DbEntities Contex = new TestApi_DbEntities();
            var objEvnt = (from ep in Contex.SubjectDetails
                           join std in Contex.Studenttables on ep.StudentId equals std.StudentId
                           join sb in Contex.Subjecttables on ep.SubjectId equals sb.SubjectId
                           //join t in Contex.tbl_Title on e.TID equals t.TID
                           where ep.StudentId == studentid 
                           select new
                           {
                               subjectDetails = ep,
                               student = std,
                               subject = sb
                           });
            foreach (var v in objEvnt)
            {
               
                SubjectDetailModel objsub = new SubjectDetailModel();
                objsub.StudentName = v.student.StudentName;
                objsub.SubjectName = v.subject.SubjectName;
                objsub.Id = v.subjectDetails.Id;
                stmdl.Add(objsub);
            }
            return stmdl;
        }

        public int DeleteRecord(SubjectDetailModel Projsub)
        {
            try
            {
                using (TestApi_DbEntities context = new TestApi_DbEntities())
                {
                    Mapper.CreateMap<SubjectDetailModel, SubjectDetail>();
                    var org = Mapper.Map<SubjectDetailModel, SubjectDetail>(Projsub);
                    context.Entry(org).State = EntityState.Deleted;
                    int i = context.SaveChanges();
                    return i;
                }
            }
            catch (Exception ex)
            {
                //Helper hp = new Helper();
                //hp.LogException(ex);
                return 0;
            }
        }

    }
}
