using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Calculator
{
    public partial class index : System.Web.UI.Page
    {
        protected void Button_Click(object sender, EventArgs e)
        {
            Check();
            Button btn = (Button)sender;
            string value = btn.Text;
            if (value.Equals(":"))
                value = "/";
            else if (value.Equals("X"))
                value = "*";
           
            content.Text += value;
        }
        protected void Check()
        {
            int index = content.Text.IndexOf(" = ");
            if (index != -1)
                content.Text = content.Text.Substring(0, index);
        }
        protected void Enter_Click(object sender, EventArgs e)
        {
            Check();
            try
            {
                content.Text += " = " + Evaluator.Evaluate(content.Text).ToString();
            }
            catch (Exception)
            {
                content.Text += " = Input is Invalid!";
            }
        }
        protected void C_Click(object sender, EventArgs e)
        {
            Check();
            if (content.Text.Length > 0)
                content.Text = content.Text.Substring(0, content.Text.Length - 1);
        }
        protected void CE_Click(object sender, EventArgs e)
        {
            content.Text = "";
        }

       
    }
}