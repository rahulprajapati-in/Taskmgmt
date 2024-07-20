using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations.Schema;

namespace TaskManagement.Model
{
    public class TaskMgnt
    {
        public int Id { get; set; }
        public string TaskName { get; set; }
        public string EmployeeId { get; set; }
        public string? Notes { get; set; }
        public string? FileName { get; set; }
        public byte[]? Attechment { get; set; }
        public DateTime TaskStartDate { get; set; }
        public DateTime TaskEndDate { get; set; }
        public bool TaskStatus { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public string? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
}
