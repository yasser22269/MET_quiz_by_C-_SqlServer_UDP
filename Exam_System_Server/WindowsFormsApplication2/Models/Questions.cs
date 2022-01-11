using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsApplication2.Models
{
    class Questions
    {
        private int id;
        private String q_body;
        private String ob_a;
        private String ob_b;
        private String ob_c;
        private String ob_d;
        private String answer;
        private int exam_id;

        public Questions()
        {

        }
        public Questions(string q_body, string ob_a, string ob_b, string ob_c, string ob_d, string answer)
        {
            this.q_body = q_body;
            this.ob_a = ob_a;
            this.ob_b = ob_b;
            this.ob_c = ob_c;
            this.ob_d = ob_d;
            this.answer = answer;
        }

        public override string ToString()
        {
            return this.q_body+ splitMark() + this.ob_a+ splitMark() + this.ob_b + splitMark() + this.ob_c + splitMark() + this.ob_d + splitMark() + this.answer + splitMark();
        }
        private String splitMark()
        {
            return "#";
        }
        public static String listToString(List<Questions> list)
        {
            String result="";
            foreach(Questions questions in list)
            {
                result += questions.ToString();
            }
            return result;
        }
    }
}
