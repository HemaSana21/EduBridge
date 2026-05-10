class Student {
  final String name;
  final String gradeAndSchool;
  final String imageUrl;
  final int progressPercent;
  final String riskStatus; // 'High Risk', 'Medium Risk', 'Low Risk'
  final String monthlyIncome;
  final String supportRequired;
  final String story;

  Student({
    required this.name,
    required this.gradeAndSchool,
    required this.imageUrl,
    required this.progressPercent,
    required this.riskStatus,
    required this.monthlyIncome,
    required this.supportRequired,
    required this.story,
  });
}

// Fixed global database with production-ready fallback CDN images 
final List<Student> mockStudents = [
  Student(
    name: "Ananya",
    gradeAndSchool: "8th · Govt. High School",
    imageUrl: "https://www.shutterstock.com/image-photo/vommavaram-visakhapatnam-andhra-pradesh-29012019-260nw-2719075179.jpg",
    progressPercent: 62,
    riskStatus: "High Risk",
    monthlyIncome: "₹ 8,500",
    supportRequired: "Academic Mentorship & Notebooks",
    story: "Ananya is highly enthusiastic about science but misses classes frequently due to looking after her younger siblings while her parents work daily-wage jobs.",
  ),
  Student(
    name: "Rohan",
    gradeAndSchool: "5th · Primary School No. 4",
    imageUrl: "https://www.shutterstock.com/image-photo/smiling-indian-rural-school-boy-260nw-2376712537.jpg",
    progressPercent: 78,
    riskStatus: "Medium Risk",
    monthlyIncome: "₹ 7,200",
    supportRequired: "School Uniform & Primary Learning Kit",
    story: "Rohan loves drawing but needs help securing basic winter uniforms and writing slates to maintain steady school attendance.",
  ),
  Student(
    name: "Fatima Sheikh",
    gradeAndSchool: "10th · Girls High School",
    imageUrl: "https://www.shutterstock.com/image-photo/portrait-happy-smiling-pakistani-muslim-260nw-2298601167.jpg",
    progressPercent: 54,
    riskStatus: "High Risk",
    monthlyIncome: "₹ 5,100",
    supportRequired: "Daily Nutritional Meal Plan",
    story: "Due to acute household financial strain, nutritional access is limited, hindering Fatima's daily energy levels and high school learning progress.",
  ),
  Student(
    name: "Aditya",
    gradeAndSchool: "6th · Municipal School",
    imageUrl: "https://www.shutterstock.com/image-photo/rural-indian-school-girl-stanging-260nw-2222653621.jpg",
    progressPercent: 85,
    riskStatus: "Low Risk",
    monthlyIncome: "₹ 11,500",
    supportRequired: "Primary Storybooks & Pencil Set",
    story: "Aditya has exceptional observation skills. Support with basic educational storybooks will keep his academic curiosity alive.",
  ),
  Student(
    name: "Sai Prasad",
    gradeAndSchool: "1st Std · Govt. Primary School, Nellore",
    imageUrl: "https://www.shutterstock.com/image-photo/portrait-5-year-old-boy-260nw-2377574765.jpg",
    progressPercent: 80,
    riskStatus: "Low Risk",
    monthlyIncome: "₹ 10,200",
    supportRequired: "Basic Mathematics Abacus Kit",
    story: "Sai exhibits strong analytical patterns for his age. Offering him a physical abacus kit will support his interest in basic subtraction and addition.",
  ),
  Student(
    name: "Divya Teja",
    gradeAndSchool: "UKG · Zilla Parishad School, Guntur",
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmuv9Reh9GDCqIo4HqJYvKPogNr_wAoUmrfQ&s",
    progressPercent: 67,
    riskStatus: "Medium Risk",
    monthlyIncome: "₹ 7,500",
    supportRequired: "School Uniform & Regular Footwear",
    story: "Divya is eager to learn, but walking barefoot or in worn-out slippers to her school makes travel painful. Sturdy footwear is her priority request.",
  ),
  Student(
    name: "Vikram Dev",
    gradeAndSchool: "1st Std · Zilla Parishad School, Alibag",
    imageUrl: "https://t3.ftcdn.net/jpg/10/67/48/72/360_F_1067487218_9rS1wjZVtPqsX6SvIyoSLBlRdGCoy1vq.jpg",
    progressPercent: 68,
    riskStatus: "Medium Risk",
    monthlyIncome: "₹ 8,900",
    supportRequired: "Writing Notebooks & Stationery Kit",
    story: "Vikram's father is an agricultural helper whose income is highly seasonal. Helping Vikram secure writing supplies ensures he won't fall behind during dry farming months.",
  ),
  Student(
    name: "Meera",
    gradeAndSchool: "LKG · Panchayat Union Primary School",
    imageUrl: "https://static.vecteezy.com/system/resources/thumbnails/048/823/835/small/a-cheerful-girl-stands-proudly-with-arms-crossed-under-sunny-skies-photo.jpeg",
    progressPercent: 49,
    riskStatus: "High Risk",
    monthlyIncome: "₹ 4,500",
    supportRequired: "Basic Speech Therapy & Alphabet Cards",
    story: "Meera requires extra guidance with language pronunciation. Customized speech activities and targeted worksheets will help build her social confidence.",
  ),
];






