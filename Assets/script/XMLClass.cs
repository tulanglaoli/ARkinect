using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;

namespace XMLCLass
{
    public class Class1
    {
        public static string XMLRead(string Path, string Name, int a)
        {
            XmlDocument xmlDoc = new XmlDocument();
			//System.IO.File.Move(server.mappath(Path), Path+".xml");
			Path = Path+".xml";
            xmlDoc.Load(Path);//".\\exe_Data\\Resources\\"+
            XmlNode node = xmlDoc.DocumentElement;//
            XmlNodeList xnl;

            xnl = node.SelectNodes("_iUser");
             XmlNode xe = (XmlNode)xnl.Item(0);

             xnl = xe.SelectSingleNode(Name).ChildNodes;
			//a = decSecrate(a);
            xe = (XmlNode)xnl.Item(a);
            return float.Parse(xe.InnerText).ToString();
        }

        public static void XMLWrite(string Path, string Name, int i, string Value)
        {
            XmlDocument xmlDoc = new XmlDocument ();
			//System.IO.File.Move(server.mappath(Path), Path+".xml");
			Path =Path+".xml";
            xmlDoc.Load(Path);
            XmlNode node = xmlDoc.DocumentElement;//
            XmlNodeList xnl;

            xnl = node.SelectNodes("_iUser");
            XmlNode xe = (XmlNode)xnl.Item(0);

            xnl = xe.SelectSingleNode(Name).ChildNodes;
             xe = (XmlNode)xnl.Item(i);
			Value = float.Parse(Value).ToString();
            xe.InnerText = Value;
			//System.IO.File.Move(server.mappath(Path+".xml"), Path);
            xmlDoc.Save(Path);//保存。

        }
		
		public static int AddSecrate(int Num)
		{
				int  Temp = Num*3+11;
			return Temp;
		}
		
		
		public static int decSecrate(int Temp)
		{
			int Num = (Temp-11)/3;
			return Num;
		
		}
    }
}
