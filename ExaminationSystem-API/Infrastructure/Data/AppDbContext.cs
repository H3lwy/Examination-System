using Domain.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Data
{
    public class AppDbContext : IdentityDbContext<User>
    {
        public DbSet<Exam> Exams { get; set; }
        public DbSet<Question> Questions { get; set; }
        public DbSet<Choice> Choices { get; set; }
        public DbSet<ExamQuestion> ExamQuestions { get; set; }
        public DbSet<StudentExam> StudentExams { get; set; }
        public DbSet<StudentExamQuestionAnswer> StudentExamQuestionAnswers { get; set; }
        public DbSet<Subject> Subjects { get; set; }

        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.Entity<ExamQuestion>()
                .HasKey(i => new { i.ExamId, i.QuestionId });

            builder.Entity<ExamQuestion>()
                .HasOne(i => i.Exam)
                .WithMany(e => e.ExamQuestions)
                .HasForeignKey(i => i.ExamId)
                .OnDelete(DeleteBehavior.NoAction);

            builder.Entity<ExamQuestion>()
                .HasOne(i => i.Question)
                .WithMany(q => q.examQuestions)
                .HasForeignKey(i => i.QuestionId)
                .OnDelete(DeleteBehavior.NoAction);

            builder.Entity<StudentExamQuestionAnswer>()
                .HasOne(s => s.StudentExam)
                .WithMany(se => se.studentExamQuestionAnswers)
                .HasForeignKey(s => s.StudentExamId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.Entity<StudentExamQuestionAnswer>()
                .HasOne(s => s.Question)
                .WithMany()
                .HasForeignKey(s => s.QuestionId)
                .OnDelete(DeleteBehavior.NoAction);

            builder.Entity<StudentExamQuestionAnswer>()
                .HasOne(s => s.Choice)
                .WithMany()
                .HasForeignKey(s => s.SelectedChoiceId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.Entity<StudentExam>()
                .HasOne(se => se.Student)
                .WithMany()
                .HasForeignKey(se => se.StudentId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.Entity<StudentExam>()
                .HasOne(se => se.Exam)
                .WithMany(e => e.StudentExams)
                .HasForeignKey(se => se.ExamId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.Entity<StudentExam>()
                .HasOne(se => se.Subject)
                .WithMany(s => s.students)
                .HasForeignKey(se => se.SubjectId)
                .OnDelete(DeleteBehavior.NoAction);

            builder.Entity<Subject>()
                .HasMany(s => s.exams)
                .WithOne(e => e.Subject)
                .HasForeignKey(e => e.SubjectId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.Entity<Question>()
                .HasMany(q => q.choices)
                .WithOne(c => c.Question)
                .HasForeignKey(c => c.QuestionId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.Entity<Question>()
            .HasOne(q => q.Subject)
            .WithMany(s => s.Questions)
            .HasForeignKey(q => q.SubjectId)
            .OnDelete(DeleteBehavior.Cascade);

            SeedAdminUser(builder);
        }

        private void SeedAdminUser(ModelBuilder builder)
        {
            var adminRoleId = Guid.NewGuid().ToString();
            builder.Entity<IdentityRole>().HasData(new IdentityRole
            {
                Id = adminRoleId,
                Name = "Admin",
                NormalizedName = "ADMIN"
            });

            var adminId = Guid.NewGuid().ToString();
            var adminUser = new User
            {
                Id = adminId,
                FirstName = "Hisham",
                LastName = "Alwy",
                UserName = "Hisham",
                NormalizedUserName = "HISHAM",
                Email = "hisham.3lwy@gmail.com",
                NormalizedEmail = "HISHAM.3LWY@GMAIL.COM",
                EmailConfirmed = true,
                IsActive = true,
                SecurityStamp = Guid.NewGuid().ToString()
            };

            var hasher = new PasswordHasher<User>();
            adminUser.PasswordHash = hasher.HashPassword(adminUser, "hishamalwy123");

            builder.Entity<User>().HasData(adminUser);

            builder.Entity<IdentityUserRole<string>>().HasData(new IdentityUserRole<string>
            {
                UserId = adminId,
                RoleId = adminRoleId
            });
        }
    }
}
