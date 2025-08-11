local config = {
  cmd = { "jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradle", ".git", "mvnw", ".mvn", "pom.xml", "src" }, { upward = true })[1]),
  settings = {
    java = {
      project = {
        referencedLibraries = {
          '/Users/lunawilkes/Onedrive/2025/TRI2/tutoring/COMP103/ecs100.jar'
        },
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-19",
            path = "/Users/lunawilkes/Library/Java/JavaVirtualMachines/openjdk-19.0.2/Contents/Home",
          },
          {
            name = "JavaSE-22",
            path = "/Users/lunawilkes/Library/Java/JavaVirtualMachines/jdk-22.0.2.jdk/Contents/Home/",
          },
        },
      },
    },
  },
}
require("jdtls").start_or_attach(config)
