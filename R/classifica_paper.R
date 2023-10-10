
classifica_paper_old <- function(resumo, numero){
    
    print(numero)
    
    prompt <- "Darei um resumo de um paper entre <<<<<<<<<< e >>>>>>>>>>.
    
    Você vai definir sobre qual area o paper está falando.
    
    <<<<<<<<<<{resumo}>>>>>>>>>>
    
    Considere as 11 seguintes areas do SWEBOK:
    
    1. Software Requirements:
    This area covers the elicitation, analysis, specification, and validation of software requirements. Practices include identifying and documenting functional and non-functional requirements, using modeling techniques, and verifying requirements to ensure they are correct, complete, and consistent.
    
    2. Software Design:
    This area involves defining the architecture, components, modules, interfaces, and data for a system to meet specified requirements. Practices include applying design patterns, decomposition techniques, and utilizing modeling languages such as UML (Unified Modeling Language).
    
    3. Software Construction:
    This area addresses the implementation of software components and systems according to design specifications. Practices include coding, selecting appropriate data structures and algorithms, applying coding standards, and using tools and libraries.
    
    4. Software Testing:
    This area focuses on the process of evaluating software to detect defects, ensure conformance to requirements, and assess quality. Practices include test planning, test case design, test execution, and test automation.
    
    5. Software Maintenance:
    This area covers the activities required to keep software operational and up-to-date after deployment. Practices include correcting defects, enhancing functionality, optimizing performance, and adapting software to new environments or technologies.
    
    6. Software Configuration Management:
    This area involves the identification, control, and tracking of software artifacts and changes throughout the development lifecycle. Practices include version control, change management, build management, and release management.
    
    7. Software Engineering Management:
    This area deals with the planning, coordinating, monitoring, and controlling of software engineering projects. Practices include project planning, risk management, resource allocation, and team management.
    
    8. Software Engineering Process:
    This area focuses on the definition, implementation, and improvement of software engineering processes. Practices include process modeling, process assessment, process improvement, and process management.
    
    9. Software Engineering Models and Methods:
    This area addresses the various models and methods used to represent, analyze, and design software systems. Practices include the use of formal methods, model-driven development, simulation, and prototyping.
    
    10. Software Quality:
    This area covers the assurance and assessment of software product quality, including quality attributes, quality models, and quality management practices. Practices include quality planning, quality control, quality assurance, and quality measurement.
    
    11. Software Engineering Professional Practice:
    This area focuses on the ethical and professional aspects of software engineering, including adherence to codes of conduct, professional development, and maintaining competence. Practices include communication skills, teamwork, time management, and continuous learning.

    Determine, para cada uma das 11 areas, o grau de aderência do paper à area em um número de 0 a 100. Justifique a escolha do grau de aderência. Não dê graus iguais. Dê 100 para uma das áreas e apenas uma das áreas

    A resposta deve ser em inglês e deve ter 11 linhas em ordem decrescente de grau de aderência no seguinte formato:  <número da área, apenas o número> ; <grau de aderencia>; <nome da área>; <justificativa>


    " |> str_glue()
    
    resposta <- create_chat_completion(
        model = "gpt-3.5-turbo",
        temperature = 0,
        messages = list(
            list(
                "role" = "system",
                "content" = prompt
            )
        ),
        
    )

    resposta <- resposta$choices$message.content
    
    write_lines(resposta, "classificacao/{numero}" |>  str_glue())
    
    resposta

}







classifica_paper <- function(resumo, numero){
    
    print(numero)
    
    prompt_swebok <- "
    
    Considere as seguintes areas do SWEBOK e suas práticas. Esses itens de segundo nível (1.1, 1.2, ...) são as 'práticas das áreas do SWEBOK':
    
    1. Software Requirements: Eliciting, analyzing, specifying, and validating the needs and constraints of software systems

        1.1 - Elicitation techniques (interviews, workshops, use cases, scenarios, etc.)
        1.2 - Requirements analysis (feasibility, risk, cost-benefit, etc.)
        1.3 - Requirements specification (functional, non-functional, performance, etc.)
        1.4 - Validation and verification (inspection, walkthroughs, reviews, etc.)
        1.5 - Management and traceability (change control, impact analysis, etc.)    

    2. Software Design: Defining the architecture, components, modules, interfaces, and data for a software system to satisfy specified requirements. 
    
        2.1 - Architectural design (layered, client-server, microservices, etc.)
        2.2 - Component-level design (object-oriented, functional, etc.)
        2.3 - User interface design (wireframes, mockups, usability, accessibility, etc.)
        2.4 - Design patterns (creational, structural, behavioral, etc.)
        2.5 - Design for reuse (libraries, frameworks, APIs, etc.)
        2.6 - Design quality attributes (performance, scalability, maintainability, etc.)    
    
    3. Software Construction: Implementing the design by creating software components, assembling them, and integrating them into a complete software system

        3.1 - Coding standards (naming conventions, indentation, commenting, etc.)
        3.2 - Programming languages and paradigms (imperative, declarative, etc.)
        3.3 - Code review and inspection (manual, automated, pair programming, etc.)
        3.4 - Integration and build processes (continuous integration, build automation, etc.)
        3.5 - Unit testing (test-driven development, test doubles, test coverage, etc.)    
    
    
    4. Software Testing: Evaluating a software system or component to determine whether it meets its specified requirements and identifying potential defects.

        4.1 - Test planning and design (test strategy, test plan, test cases, etc.)
        4.2 - Test execution and automation (test scripts, test harnesses, test data, etc.)
        4.3 - Test coverage analysis (statement, branch, path, etc.)
        4.4 - Test case prioritization and selection (risk-based, regression, etc.)
        4.5 - Performance testing (load, stress, endurance, etc.)
    
    5. Software Maintenance: Modifying a software system after delivery to correct faults, improve performance, or adapt to a changed environment.

        5.1 - Corrective maintenance (bug fixing, defect removal, etc.)
        5.2 - Adaptive maintenance (platform migration, software updates, etc.)
        5.3 - Perfective maintenance (feature enhancements, optimizations, etc.)
        5.4 - Preventive maintenance (code refactoring, documentation updates, etc.)
        5.5 - Configuration management (change control, versioning, etc.)    
    

    6. Software Configuration Management: Identifying, organizing, and controlling changes to software artifacts throughout their lifecycle.

        6.1 - Version control (centralized, distributed, etc.)
        6.2 - Change management (change request, impact analysis, etc.)
        6.3 - Build management (build scripts, build automation, etc.)
        6.4 - Release management (release planning, deployment, rollback, etc.)
        6.5 - Branching and merging strategies (feature branches, release branches, etc.)    
    
    7. Software Engineering Management: Applying management activities to ensure that software products and software engineering processes meet their objectives.

        7.1 - Project planning (scope, objectives, resources, etc.)
        7.2 - Risk management (identification, assessment, mitigation, etc.)
        7.3 - Estimation techniques (expert judgment, analogy-based, parametric, etc.)
        7.4 - Project monitoring and control (progress tracking, reviews, audits, etc.)
        7.5 - Quality assurance (processes, standards, reviews, audits, etc.)    
    
    8. Software Engineering Process: Defining, implementing, assessing, measuring, and improving the software lifecycle processes used by an organization.

        8.1 - Process models (waterfall, iterative, incremental, etc.)
        8.2 - Process improvement (CMMI, ISO/IEC 15504, etc.)
        8.3 - Process assessment and certification (CMMI appraisal, ISO certification, etc.)
        8.4 - Software measurement and metrics (productivity, quality, complexity, etc.)
        8.5 - Agile methodologies (Scrum, Kanban, Lean, XP, etc.)    

    9. Software Engineering Models and Methods: Using principles, techniques, and tools to model, analyze, and specify software requirements, design, and architecture.

        9.1 - Integrated development environments (IDEs) (Eclipse, IntelliJ IDEA, etc.)
        9.2 - Version control systems (Git, SVN, Mercurial, etc.)    
        9.3 - Continuous integration and continuous delivery (CI/CD) tools (Jenkins, GitLab CI/CD, Travis CI, etc.)
        9.4 - Static and dynamic analysis tools (SonarQube, Coverity, Valgrind, etc.)
        9.5 - Requirements management tools (Jira, Trello, IBM Rational DOORS, etc.)
        9.6 - Test management tools (TestRail, QTest, Zephyr, etc.)
        9.7 - Modeling tools (UML, SysML, BPMN, etc.)
        9.8 - Project management tools (Microsoft Project, Smartsheet, Basecamp, etc.)
        9.9 - Collaboration tools (Slack, Microsoft Teams, Confluence, etc.)        
    
    10. Software Quality: Ensuring a software system meets its specified requirements and user needs, and applying practices and activities aimed at achieving high quality.

        10.1 - Quality models (ISO/IEC 9126, McCall's, Boehm's, etc.)
        10.2 - Quality assurance techniques (reviews, inspections, walkthroughs, etc.)
        10.3 - Quality control (testing, verification, validation, etc.)
        10.4 - Quality management (quality planning, quality metrics, etc.)    
        10.5 - Quality standards and certifications (ISO 9001, ISO/IEC 25000, CMMI, etc.)    
    
    11. Software Engineering Professional Practice: Fulfilling the ethical, legal, and professional responsibilities of software engineers and applying engineering practices to software development.

        11.1 - Ethical considerations (professionalism, responsibility, accountability, etc.)
        11.2 - Professional development (continuing education, certifications, etc.)
        11.3 - Intellectual property (copyright, patents, trademarks, licensing, etc.)
        11.4 - Standards and compliance (ISO, IEEE, industry-specific, etc.)
        11.5 - Legal and regulatory aspects (data privacy, security, export control, etc.)
        11.6 - Communication and teamwork (collaboration, conflict resolution, negotiation, etc.)
        11.7 - Cultural and global aspects (diversity, localization, distributed teams, etc.)    

    " |> str_glue()

    
    prompt_tarefa = "
        
        Sua tarefa é identificar, no resumo de paper que o user vai passar, quais 'práticas das áreas do SWEBOK' são abordadas.
        
        As 'práticas das áreas do SWEBOK' foram listadas para você na mensagem anterior em itens numerados como 1.1, 1.2, ...
        
        Liste as 'práticas das áreas do SWEBOK' abordadas no paper e justifique por que você acha que cada 'prática da área do SWEBOK' foi abordada usando trechos extraídos do paper
        
        Liste apenas as práticas abordadas

    
    "
    
    
    prompt_user = "
    
    Realize a tarefa da mensagem anterior para o seguinte paper. Os trechos a seguir são do mesmo paper
    
    {resumo}
    
    
    " |> str_glue()
    
        
    resposta <- create_chat_completion(
        model = "gpt-3.5-turbo",
        temperature = 0,
        messages = list(
            list(
                "role" = "system",
                "content" = prompt_swebok
            ),
            list(
                "role" = "system",
                "content" = prompt_tarefa
            ),
            list(
                "role" = "user",
                "content" = prompt_user
            )
        ),
        
    )
    

    resposta <- resposta$choices$message.content
    
    write_lines(resposta, "classificacao_nova/{numero}" |>  str_glue())
    
    resposta
    
}














