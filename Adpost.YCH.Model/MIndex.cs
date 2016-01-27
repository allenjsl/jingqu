using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Adpost.YCH.Model
{
    /// <summary>
    /// 首页图片对象实体
    /// </summary>
    public class MIndexImageList
    {
        public string guid { get; set; }
        public string title { get; set; }
        public string imgPath { get; set; }
        public int userId { get; set; }
        public string userName { get; set; }
        public DateTime createTime { get; set; }
    }
}
