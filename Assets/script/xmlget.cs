using System;
using System.Text;
using System.Xml;

namespace Depthdeep
{
    class Class1
    {
        static string XMLRead(string FileAddress, string Name)
        {
            XmlTextReader xmlFile = new XmlTextReader(FileAddress);
            try
            {
                while (xmlFile.Read())
                {
                    if (xmlFile.NodeType == XmlNodeType.Element)
                        if (xmlFile.Name == Name)
                        {

                            string HandSize = xmlFile.ReadElementString().Trim();
                            return HandSize;
                        }
                }
            }
            catch
            {
                return null;
            }
            finally
            {
                xmlFile.Close();
            }
            return null;
        }
        
        static void XMLWrite(string FileAddress)
        {
            long a = -1;
            XmlTextWriter xml = new XmlTextWriter("Book.xml", Encoding.UTF8);
            xml.Formatting = Formatting.Indented;
            xml.WriteStartDocument();
            xml.WriteStartElement("hand");

            {
                xml.WriteStartElement("HiDepthThreshold");
                xml.WriteValue(a);
                xml.WriteEndElement();
                xml.WriteStartElement("WinDis");
                xml.WriteValue(a);
                xml.WriteEndElement();
            }
            xml.WriteEndElement();
            xml.WriteEndDocument();

            xml.Flush();
            xml.Close();
        }
        
        static void XMLChange()
        {
            int bb;
            bb = int.Parse(XMLRead(@"Book.xml", "LoDepthThreshold"));
        }
    }
}

