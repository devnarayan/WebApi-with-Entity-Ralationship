//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebservicesApi
{
    using System;
    using System.Collections.Generic;
    
    public partial class E1
    {
        public E1()
        {
            this.E1_E2 = new HashSet<E1_E2>();
            this.E2 = new HashSet<E2>();
        }
    
        public int Id { get; set; }
        public string E1Name { get; set; }
    
        public virtual ICollection<E1_E2> E1_E2 { get; set; }
        public virtual ICollection<E2> E2 { get; set; }
    }
}