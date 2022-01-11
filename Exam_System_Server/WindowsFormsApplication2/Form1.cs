using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net.Sockets;
using System.Net;
using System.IO;
using System.Threading;
using WindowsFormsApplication2.dao;
using WindowsFormsApplication2.Models;

namespace WindowsFormsApplication2
{
    public partial class Form1 : Form
    {
        String selectedExam;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {

            if (selectedExam!=null)
            {
                QuestionsDAO questionsDAO = new QuestionsDAO();
                List<Questions> list = questionsDAO.getListOfQuestions(selectedExam);
                String send = Questions.listToString(list);
                UdpClient u = new UdpClient();
                u.Connect("", 8080);
                byte[] msg = Encoding.ASCII.GetBytes(send);
                u.Send(msg, msg.Length);
                u.Close();
                Application.Exit();
            }
            else
                MessageBox.Show("please select exam first", "ERROR",MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            selectedExam = "1";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            selectedExam = "2";
        }

       

    }
}
