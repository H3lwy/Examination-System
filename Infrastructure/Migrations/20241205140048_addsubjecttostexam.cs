using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addsubjecttostexam : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ExamQuestions_Exams_ExamId",
                table: "ExamQuestions");

            migrationBuilder.DropForeignKey(
                name: "FK_ExamQuestions_Questions_QuestionId",
                table: "ExamQuestions");

            migrationBuilder.DropForeignKey(
                name: "FK_Exams_Subjects_SubjectId",
                table: "Exams");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentExams_AspNetUsers_StudentId",
                table: "StudentExams");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentExams_Exams_ExamId",
                table: "StudentExams");

            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "70322f81-0f62-42ff-9974-340c5bfb5416", "d798b7ac-1973-42ae-8466-db12d2060c4d" });

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "70322f81-0f62-42ff-9974-340c5bfb5416");

            migrationBuilder.DeleteData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "d798b7ac-1973-42ae-8466-db12d2060c4d");

            migrationBuilder.AddColumn<int>(
                name: "SubjectId",
                table: "StudentExams",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "312af09f-06ae-41e4-8d17-1fa8b4acb2c1", null, "Admin", "ADMIN" });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "FirstName", "IsActive", "LastName", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "1be78214-1b7a-4354-baed-6aee225dceed", 0, "9920764a-0597-4e22-bfc9-f1604937fec7", "hisham.3lwy@gmail.com", true, "Hisham", true, "Alwy", false, null, "HISHAM.3LWY@GMAIL.COM", "HISHAM", "AQAAAAIAAYagAAAAEFQSiJjpE1WhQaDRwf8Cepe+C9m/sjseuu4ahnUwj/vYKXCJ7mKhvAuK0iFGhwpMEg==", null, false, "f6da283d-9ad5-4f57-81f4-b9c6336fced9", false, "Hisham" });

            migrationBuilder.InsertData(
                table: "AspNetUserRoles",
                columns: new[] { "RoleId", "UserId" },
                values: new object[] { "312af09f-06ae-41e4-8d17-1fa8b4acb2c1", "1be78214-1b7a-4354-baed-6aee225dceed" });

            migrationBuilder.CreateIndex(
                name: "IX_StudentExams_SubjectId",
                table: "StudentExams",
                column: "SubjectId");

            migrationBuilder.AddForeignKey(
                name: "FK_ExamQuestions_Exams_ExamId",
                table: "ExamQuestions",
                column: "ExamId",
                principalTable: "Exams",
                principalColumn: "ExamId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_ExamQuestions_Questions_QuestionId",
                table: "ExamQuestions",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "QuestionId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Exams_Subjects_SubjectId",
                table: "Exams",
                column: "SubjectId",
                principalTable: "Subjects",
                principalColumn: "SubjectId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_StudentExams_AspNetUsers_StudentId",
                table: "StudentExams",
                column: "StudentId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_StudentExams_Exams_ExamId",
                table: "StudentExams",
                column: "ExamId",
                principalTable: "Exams",
                principalColumn: "ExamId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_StudentExams_Subjects_SubjectId",
                table: "StudentExams",
                column: "SubjectId",
                principalTable: "Subjects",
                principalColumn: "SubjectId",
                onDelete: ReferentialAction.Restrict);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ExamQuestions_Exams_ExamId",
                table: "ExamQuestions");

            migrationBuilder.DropForeignKey(
                name: "FK_ExamQuestions_Questions_QuestionId",
                table: "ExamQuestions");

            migrationBuilder.DropForeignKey(
                name: "FK_Exams_Subjects_SubjectId",
                table: "Exams");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentExams_AspNetUsers_StudentId",
                table: "StudentExams");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentExams_Exams_ExamId",
                table: "StudentExams");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentExams_Subjects_SubjectId",
                table: "StudentExams");

            migrationBuilder.DropIndex(
                name: "IX_StudentExams_SubjectId",
                table: "StudentExams");

            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "312af09f-06ae-41e4-8d17-1fa8b4acb2c1", "1be78214-1b7a-4354-baed-6aee225dceed" });

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "312af09f-06ae-41e4-8d17-1fa8b4acb2c1");

            migrationBuilder.DeleteData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "1be78214-1b7a-4354-baed-6aee225dceed");

            migrationBuilder.DropColumn(
                name: "SubjectId",
                table: "StudentExams");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "70322f81-0f62-42ff-9974-340c5bfb5416", null, "Admin", "ADMIN" });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "FirstName", "IsActive", "LastName", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "d798b7ac-1973-42ae-8466-db12d2060c4d", 0, "0b9a188d-2477-4db9-97b9-625b86d8e70f", "hisham.3lwy@gmail.com", true, "Hisham", true, "Alwy", false, null, "HISHAM.3LWY@GMAIL.COM", "HISHAM", "AQAAAAIAAYagAAAAELSD+BwJ4q42EO3EiDk4Jgyd4GE1eA57SZWACEbBX+l0dCk4uhVb/EYZ+IVGvOc+qg==", null, false, "d97b545b-f5d4-473d-97b3-0f611a80fb2e", false, "Hisham" });

            migrationBuilder.InsertData(
                table: "AspNetUserRoles",
                columns: new[] { "RoleId", "UserId" },
                values: new object[] { "70322f81-0f62-42ff-9974-340c5bfb5416", "d798b7ac-1973-42ae-8466-db12d2060c4d" });

            migrationBuilder.AddForeignKey(
                name: "FK_ExamQuestions_Exams_ExamId",
                table: "ExamQuestions",
                column: "ExamId",
                principalTable: "Exams",
                principalColumn: "ExamId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ExamQuestions_Questions_QuestionId",
                table: "ExamQuestions",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "QuestionId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Exams_Subjects_SubjectId",
                table: "Exams",
                column: "SubjectId",
                principalTable: "Subjects",
                principalColumn: "SubjectId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_StudentExams_AspNetUsers_StudentId",
                table: "StudentExams",
                column: "StudentId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_StudentExams_Exams_ExamId",
                table: "StudentExams",
                column: "ExamId",
                principalTable: "Exams",
                principalColumn: "ExamId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
