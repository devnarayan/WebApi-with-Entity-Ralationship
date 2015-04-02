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
        List<E1Model> Allstudent();

    }
    public class StudentServices : IStudentService
    {

        public int AddsubjectDetail(E1_E2Model ObjSubject)
        {
            try
            {
                using (TestApi_DbEntities contex = new TestApi_DbEntities())
                {

                    Mapper.CreateMap<E1_E2Model, E1_E2>();
                    var stmdl = Mapper.Map<E1_E2Model, E1_E2>(ObjSubject);
                    contex.E1_E2.Add(stmdl);
                    //contex.SubjectDetails.Add(stmdl);
                    int i = contex.SaveChanges();
                    return i;

                };

            }
            catch (Exception ex)
            {
                               
                return 0;
            }

        }

        public List<E1Model> Allstudent()
        {
            List<E1Model> stsmdl = new List<E1Model>();
            using (TestApi_DbEntities contex = new TestApi_DbEntities())
            {
                var studentsAll = contex.E1.ToList();
                foreach (var std in studentsAll)
                {
                    Mapper.CreateMap<E1, E1Model>();
                    var mdlstd = Mapper.Map<E1, E1Model>(std);
                    stsmdl.Add(mdlstd);

                }
            }
            return stsmdl;
        }

        public List<E2Model> Allstubjectbystudent(int studentid)
        {
            List<E2Model> stbmdl = new List<E2Model>();
            using (TestApi_DbEntities contex = new TestApi_DbEntities())
            {
                var stsAll = contex.E2.Where(e => e.E1Id == studentid).ToList();
                foreach (var std in stsAll)
                {
                    Mapper.CreateMap<E2, E2Model>();
                    var mdlstd = Mapper.Map<E2, E2Model>(std);
                    stbmdl.Add(mdlstd);

                }
            }
            return stbmdl;
        }

        public List<E1_E2Model> Getrecord(int studentid, int subjectid)
        {

            List<E1_E2Model> stmdl = new List<E1_E2Model>();
            TestApi_DbEntities Contex = new TestApi_DbEntities();
            var objEvnt = (from ep in Contex.E1_E2
                           join std in Contex.E1 on ep.E1ID equals std.Id
                           join sb in Contex.E2 on ep.E2ID equals sb.Id
                           //join t in Contex.tbl_Title on e.TID equals t.TID
                           where ep.E1ID == studentid 
                           select new
                           {
                               subjectDetails = ep,
                               student = std,
                               subject = sb
                           });
            foreach (var v in objEvnt)
            {

                E1_E2Model objsub = new E1_E2Model();
                objsub.E1Name = v.student.E1Name;
                objsub.E2Name = v.subject.E2Name;
                objsub.Id = v.subjectDetails.Id;
                stmdl.Add(objsub);
            }
            return stmdl;
        }

        public int DeleteRecord(E1_E2Model Projsub)
        {
            try
            {
                using (TestApi_DbEntities context = new TestApi_DbEntities())
                {
                    Mapper.CreateMap<E1_E2Model, E1_E2>();
                    var org = Mapper.Map<E1_E2Model, E1_E2>(Projsub);
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
