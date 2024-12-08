using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class secondetry : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "5662e620-1491-436b-bfc3-1c9766dee7bb", "5fa81762-3340-43aa-9711-243230692fd2" });

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "5662e620-1491-436b-bfc3-1c9766dee7bb");

            migrationBuilder.DeleteData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5fa81762-3340-43aa-9711-243230692fd2");

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

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
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

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "5662e620-1491-436b-bfc3-1c9766dee7bb", null, "Hisham", "HISHAM" });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "IsActive", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "5fa81762-3340-43aa-9711-243230692fd2", 0, "ec434432-4b7c-41c9-a33c-eab152abb864", "hisham.3lwy@gmail.com", true, true, false, null, "HISHAM.3LWY@GMAIL.COM", "HISHAM", "AQAAAAIAAYagAAAAEPybPT2EBzbCmFyNOr68LQssEhlTpjDZRofU5L9vItROjJFR+thoQwIQTCGZ0eOdJQ==", null, false, "485c79fe-65b9-4cd6-8731-8bc2a408f661", false, "Hisham" });

            migrationBuilder.InsertData(
                table: "AspNetUserRoles",
                columns: new[] { "RoleId", "UserId" },
                values: new object[] { "5662e620-1491-436b-bfc3-1c9766dee7bb", "5fa81762-3340-43aa-9711-243230692fd2" });
        }
    }
}
