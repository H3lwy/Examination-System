using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class fnameandlastname : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "96eb1308-abbe-46f8-8457-45f54c4ef68e", "22a42b2b-be24-48ac-9039-a1b94d102fda" });

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "96eb1308-abbe-46f8-8457-45f54c4ef68e");

            migrationBuilder.DeleteData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "22a42b2b-be24-48ac-9039-a1b94d102fda");

            migrationBuilder.AddColumn<string>(
                name: "FirstName",
                table: "AspNetUsers",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "LastName",
                table: "AspNetUsers",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "262fce93-9651-4a31-80c0-3684084ac825", null, "Hisham", "HISHAM" });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "FirstName", "IsActive", "LastName", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "3f25c510-cff1-428c-a4e2-bc800e85a941", 0, "a5d84ba5-3032-43b6-95a0-99495c264d65", "hisham.3lwy@gmail.com", true, "Hisham", true, "Alwy", false, null, "HISHAM.3LWY@GMAIL.COM", "HISHAM", "AQAAAAIAAYagAAAAEHDEyuMVDkwpGw3EOdfU/bMAyRv7sw/owPuXndv3pD96wTmZEshHlOhAO1XakHhb9Q==", null, false, "e35942f3-71c7-4f21-92e6-19b85502e187", false, "Hisham" });

            migrationBuilder.InsertData(
                table: "AspNetUserRoles",
                columns: new[] { "RoleId", "UserId" },
                values: new object[] { "262fce93-9651-4a31-80c0-3684084ac825", "3f25c510-cff1-428c-a4e2-bc800e85a941" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "262fce93-9651-4a31-80c0-3684084ac825", "3f25c510-cff1-428c-a4e2-bc800e85a941" });

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "262fce93-9651-4a31-80c0-3684084ac825");

            migrationBuilder.DeleteData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3f25c510-cff1-428c-a4e2-bc800e85a941");

            migrationBuilder.DropColumn(
                name: "FirstName",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "LastName",
                table: "AspNetUsers");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "96eb1308-abbe-46f8-8457-45f54c4ef68e", null, "Hisham", "HISHAM" });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "IsActive", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "22a42b2b-be24-48ac-9039-a1b94d102fda", 0, "6490541d-fc8c-4e60-bc11-7a99fc0c1667", "hisham.3lwy@gmail.com", true, true, false, null, "HISHAM.3LWY@GMAIL.COM", "HISHAM", "AQAAAAIAAYagAAAAEL9k5e0MOFtpVqG7xgAZdLHbjkq1UgOJ8W8Xhe///qALn4CRMM3EsZpeWGeubYnUPQ==", null, false, "363badc1-84fc-456d-949e-4ca31e937b2d", false, "Hisham" });

            migrationBuilder.InsertData(
                table: "AspNetUserRoles",
                columns: new[] { "RoleId", "UserId" },
                values: new object[] { "96eb1308-abbe-46f8-8457-45f54c4ef68e", "22a42b2b-be24-48ac-9039-a1b94d102fda" });
        }
    }
}
