using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.Net.Sockets;
using System.Net;
using System.Threading;
namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        int count = 0, CountCourrectAnswer=0;
        String CourrectAnswer, Answer;
        string[] words;

        private void textReceiver()
        {
            UdpClient u = new UdpClient(8080);
            IPEndPoint ip = new IPEndPoint(IPAddress.Any, 0);
            byte[] data;
            data = u.Receive(ref ip);
            string title = Encoding.ASCII.GetString(data);
            TextBox.CheckForIllegalCrossThreadCalls = false;
            words = title.Split('#');
            textBox2.Text = words[count];
            button1.Text = words[count+1];
            button2.Text = words[count+2];
            button3.Text = words[count+3];
            button4.Text = words[count+4];
            CourrectAnswer = words[count+5];
        }

        private void Form1_Load(object sender, EventArgs e)
        {
             Thread t = new Thread(new ThreadStart(textReceiver));
            t.Start();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Answer = button1.Text;
            label1.Text = "Your Choosen Answer is : " + Answer;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Answer = button4.Text;
            label1.Text = "Your Choosen Answer is : " + Answer;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Answer = button3.Text;
            label1.Text = "Your Choosen Answer is : " + Answer;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Answer = button2.Text;
            label1.Text = "Your Choosen Answer is : " + Answer;
        }

        private void Next_Click(object sender, EventArgs e)
        {
            if (Answer == null)
            {
                label1.Text="Please Choose An Answer";
                return;
            }
            if (CourrectAnswer.Contains(Answer) == true)
                CountCourrectAnswer++;
            count += 6;
            if (words.Length <= count+1)
            {
                MessageBox.Show("Result = " + CountCourrectAnswer);
                MessageBox.Show("Thanks");
                Application.Exit();
            }
            else {
                textBox2.Text = words[count];
                button1.Text = words[count + 1];
                button2.Text = words[count + 2];
                button3.Text = words[count + 3];
                button4.Text = words[count + 4];
                CourrectAnswer = words[count + 5];
                Answer = null;
                label1.Text = "";
            }
        }

        private void openFileDialog1_FileOk(object sender, CancelEventArgs e)
        {

        }


    }
}
