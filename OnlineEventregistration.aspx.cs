using System;
using System.Text;

namespace EventRegistration
{
    public partial class OnlineEventregistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Fix: Disable unobtrusive validation
            Page.UnobtrusiveValidationMode =
                System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                lblResult.Text = string.Empty;
            }
        }

        // Custom validator: makes sure the Terms & Conditions checkbox is checked
        protected void cvTerms_ServerValidate(
            object source,
            System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = chkTerms.Checked;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                lblResult.Text = string.Empty;
                return;
            }

            string department =
                rblDepartment.SelectedItem != null
                ? rblDepartment.SelectedItem.Text
                : "";

            string gender =
                rblGender.SelectedItem != null
                ? rblGender.SelectedItem.Text
                : "";

            string selectedEvent =
                ddlEvent.SelectedItem != null
                ? ddlEvent.SelectedItem.Text
                : "";

            StringBuilder skills = new StringBuilder();

            foreach (System.Web.UI.WebControls.ListItem item in cblSkills.Items)
            {
                if (item.Selected)
                {
                    if (skills.Length > 0)
                        skills.Append(", ");

                    skills.Append(item.Text);
                }
            }

            if (skills.Length == 0)
                skills.Append("None");

            StringBuilder summary = new StringBuilder();

            summary.AppendLine("Registration Successful!");
            summary.AppendLine("Name: " + txtFullName.Text.Trim());
            summary.AppendLine("Email: " + txtEmail.Text.Trim());
            summary.AppendLine("Contact: " + txtContact.Text.Trim());
            summary.AppendLine("College: " + txtCollege.Text.Trim());
            summary.AppendLine("Department: " + department);
            summary.AppendLine("Event: " + selectedEvent);
            summary.AppendLine("Gender: " + gender);
            summary.AppendLine("Skills: " + skills.ToString());
            summary.AppendLine("Address: " + txtAddress.Text.Trim());

            lblResult.Text = summary.ToString();
        }
    }
}