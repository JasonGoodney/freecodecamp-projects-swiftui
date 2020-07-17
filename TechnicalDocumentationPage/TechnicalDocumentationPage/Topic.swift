//
//  Topic.swift
//  TechnicalDocumentationPage
//
//  Created by Jason Goodney on 7/15/20.
//

import Foundation

struct Topic: Hashable {
    let title: String
    let contents: [Content]
    
    static let examples: [Topic] = [
        Topic(title: "Introduction", contents: [
                Content(type: .paragraph, text: "JavaScript is a cross-platform, object-oriented scripting language. It is a small and lightweight language. Inside a host environment (for example, a web browser), JavaScript can be connected to the objects of its environment to provide programmatic control over them."),
              Content(type: .paragraph, text: "JavaScript contains a standard library of objects, such as Array, Date, and Math, and a core set of language elements such as operators, control structures, and statements. Core JavaScript can be extended for a variety of purposes by supplementing it with additional objects; for example:"),
              Content(type: .bullet, text: "Client-side JavaScript extends the core language by supplying objects to control a browser and its Document Object Model (DOM). For example, client-side extensions allow an application to place elements on an HTML form and respond to user events such as mouse clicks, form input, and page navigation."),
              Content(type: .bullet, text: "Server-side JavaScript extends the core language by supplying objects relevant to running JavaScript on a server. For example, server-side extensions allow an application to communicate with a database, provide continuity of information from one invocation to another of the application, or perform file manipulations on a server."),
            ]
        ),
        
        Topic(title: "What you should already know", contents: [
            Content(type: .paragraph, text: "This guide assumes you have the following basic background:"),
            Content(type: .bullet, text: "A general understanding of the Internet and the World Wide Web (WWW)."),
            Content(type: .bullet, text: "Good working knowledge of HyperText Markup Language (HTML)."),
            Content(type: .bullet, text: "Some programming experience. If you are new to programming, try one of the tutorials linked on the main page about JavaScript."),
            ]
        ),
        Topic(title: "JavaScript and Java", contents: [
            Content(type: .paragraph, text: "JavaScript and Java are similar in some ways but fundamentally different in some others. The JavaScript language resembles Java but does not have Java's static typing and strong type checking. JavaScript follows most Java expression syntax, naming conventions and basic control-flow constructs which was the reason why it was renamed from LiveScript to JavaScript."),
            Content(type: .paragraph, text: "In contrast to Java's compile-time system of classes built by declarations, JavaScript supports a runtime system based on a small number of data types representing numeric, Boolean, and string values. JavaScript has a prototype-based object model instead of the more common class-based object model. The prototype-based model provides dynamic inheritance; that is, what is inherited can vary for individual objects. JavaScript also supports functions without any special declarative requirements. Functions can be properties of objects, executing as loosely typed methods."),
            Content(type: .paragraph, text: "JavaScript is a very free-form language compared to Java. You do not have to declare all variables, classes, and methods. You do not have to be concerned with whether methods are public, private, or protected, and you do not have to implement interfaces. Variables, parameters, and function return types are not explicitly typed.")
        ]
        ),
        Topic(title: "Hello World", contents: [
            Content(type: .paragraph, text: "To get started with writing JavaScript, open the Scratchpad and write your first \"Hello world\" JavaScript code:"),
            Content(type: .code, text: """
                    function greetMe(yourName) {
                        alert("Hello " + yourName);
                    }

                    greetMe("World");
                """),
            Content(type: .paragraph, text: "Select the code in the pad and hit Ctrl+R to watch it unfold in your browser!")
        ]
        ),
        Topic(title: "Variables", contents: [
            Content(type: .paragraph, text: "You use variables as symbolic names for values in your application. The names of variables, called identifiers, conform to certain rules."),
            Content(type: .paragraph, text: """
            A JavaScript identifier must start with a letter, underscore (_), or dollar sign ($); subsequent characters can also be digits (0-9). Because JavaScript is case sensitive, letters include the characters "A" through "Z" (uppercase) and the characters "a" through "z" (lowercase).
            """),
            Content(type: .paragraph, text: "You can use ISO 8859-1 or Unicode letters such as å and ü in identifiers. You can also use the Unicode escape sequences as characters in identifiers. Some examples of legal names are Number_hits, temp99, and _name.")
        ]
        ),
        Topic(title: "Declaring Variables", contents: [
            Content(type: .paragraph, text: "You can declare a variable in three ways:"),
            Content(type: .paragraph, text: "With the keyword var. For example,"),
            Content(type: .code, text: "var x = 42"),
            Content(type: .paragraph, text: "This syntax can be used to declare both local and global variables."),
            Content(type: .paragraph, text: "By simply assigning it a value. For example,"),
            Content(type: .code, text: "x = 42"),
            Content(type: .paragraph, text: "This always declares a global variable. It generates a strict JavaScript warning. You shouldn't use this variant."),
            Content(type: .paragraph, text: "With the keyword let. For example,"),
            Content(type: .code, text: "let y = 13"),
            Content(type: .paragraph, text: "This syntax can be used to declare a block scope local variable. See Variable scope below."),
        ]
        ),
        Topic(title: "Variable scope", contents: [
            Content(type: .paragraph, text: "When you declare a variable outside of any function, it is called a global variable, because it is available to any other code in the current document. When you declare a variable within a function, it is called a local variable, because it is available only within that function."),
            Content(type: .paragraph, text: "JavaScript before ECMAScript 2015 does not have block statement scope; rather, a variable declared within a block is local to the function (or global scope) that the block resides within. For example the following code will log 5, because the scope of x is the function (or global context) within which x is declared, not the block, which in this case is an if statement."),
            Content(type: .code, text: "if (true) { var x = 5; } console.log(x); // 5"),
            Content(type: .paragraph, text: "This behavior changes, when using the let declaration introduced in ECMAScript 2015."),
            Content(type: .code, text: "if (true) { let y = 5; } console.log(y); // ReferenceError: y is not\ndefined"),
        ]
        ),
        Topic(title: "Global variables", contents: [
            Content(type: .paragraph, text: "Global variables are in fact properties of the global object. In web pages the global object is window, so you can set and access global variables using the window.variable syntax."),
            Content(type: .paragraph, text: "Consequently, you can access global variables declared in one window or frame from another window or frame by specifying the window or frame name. For example, if a variable called phoneNumber is declared in a document, you can refer to this variable from an iframe as parent.phoneNumber.")
        ]
        
        ),
        Topic(title: "Constants", contents: [
            Content(type: .paragraph, text: "You can create a read-only, named constant with the const keyword. The syntax of a constant identifier is the same as for a variable identifier: it must start with a letter, underscore or dollar sign and can contain alphabetic, numeric, or underscore characters."),
            Content(type: .code, text: "const PI = 3.14;"),
            Content(type: .paragraph, text: "A constant cannot change value through assignment or be re-declared while the script is running. It has to be initialized to a value."),
            Content(type: .paragraph, text: "The scope rules for constants are the same as those for let block scope variables. If the const keyword is omitted, the identifier is assumed to represent a variable."),
            Content(type: .paragraph, text: "You cannot declare a constant with the same name as a function or variable in the same scope. For example:"),
            Content(type: .code, text: """
                // THIS WILL CAUSE AN ERROR function f() {}; const f = 5; // THIS WILL
                CAUSE AN ERROR ALSO function f() { const g = 5; var g; //statements
                }
            """),
            Content(type: .paragraph, text: "However, object attributes are not protected, so the following statement is executed without problems."),
            Content(type: .code, text: """
                const MY_OBJECT = {"key": "value"}; MY_OBJECT.key = "otherValue";
            """),
        ]
        ),
        Topic(title: "Data types", contents: [
            Content(type: .paragraph, text: "The latest ECMAScript standard defines seven data types:"),
            Content(type: .bullet, text: "Six data types that are primitives:"),
            Content(type: .subBullet, text: "Boolean. true and false."),
            Content(type: .subBullet, text: "null. A special keyword denoting a null value. Because JavaScript is case-sensitive, null is not the same as Null, NULL, or any other variant."),
            Content(type: .subBullet, text: "undefined. A top-level property whose value is undefined."),
            Content(type: .subBullet, text: "Number. 42 or 3.14159."),
            Content(type: .subBullet, text: "String. \"Howdy\""),
            Content(type: .subBullet, text: "Symbol (new in ECMAScript 2015). A data type whose instances are unique and immutable."),
            Content(type: .bullet, text: "and Object"),
            Content(type: .paragraph, text: "Although these data types are a relatively small amount, they enable you to perform useful functions with your applications. Objects and functions are the other fundamental elements in the language. You can think of objects as named containers for values, and functions as procedures that your application can perform."),
        ]
        ),
        Topic(title: "if...else statement", contents: [
            Content(type: .paragraph, text: "Use the if statement to execute a statement if a logical condition is true. Use the optional else clause to execute a statement if the condition is false. An if statement looks as follows:"),
            Content(type: .code, text: """
            if (condition) { statement_1; }
            else { statement_2; }
            """),
            Content(type: .paragraph, text: "condition can be any expression that evaluates to true or false. See Boolean for an explanation of what evaluates to true and false. If condition evaluates to true, statement_1 is executed; otherwise, statement_2 is executed. statement_1 and statement_2 can be any statement, including further nested if statements."),
            Content(type: .paragraph, text: "You may also compound the statements using else if to have multiple conditions tested in sequence, as follows:"),
            Content(type: .code, text: """
                if (condition_1) { statement_1; }
                else if (condition_2) { statement_2;}
                else if (condition_n) { statement_n; }
                else { statement_last; }
                """),
            Content(type: .paragraph, text: "In the case of multiple conditions only the first logical condition which evaluates to true will be executed. To execute multiple statements, group them within a block statement ({ ... }) . In general, it's good practice to always use block statements, especially when nesting if statements:"),
            Content(type: .code, text: """
                if (condition) {
                    statement_1_runs_if_condition_is_true;
                    statement_2_runs_if_condition_is_true;
                } else {
                    statement_3_runs_if_condition_is_false;
                    statement_4_runs_if_condition_is_false;
                }
                """),
            Content(type: .paragraph, text: "It is advisable to not use simple assignments in a conditional expression, because the assignment can be confused with equality when glancing over the code. For example, do not use the following code:"),
            Content(type: .code, text: "if (x = y) { /* statements here */ }"),
            Content(type: .paragraph, text: "If you need to use an assignment in a conditional expression, a common practice is to put additional parentheses around the assignment. For example:"),
            Content(type: .code, text: "if ((x = y)) { /* statements here */ }"),
        ]
        ),
        Topic(title: "while statement", contents: [
            Content(type: .paragraph, text: "A while statement executes its statements as long as a specified condition evaluates to true. A while statement looks as follows:"),
            Content(type: .code, text: "while (condition) statement"),
            Content(type: .paragraph, text: "If the condition becomes false, statement within the loop stops executing and control passes to the statement following the loop."),
            Content(type: .paragraph, text: "The condition test occurs before statement in the loop is executed. If the condition returns true, statement is executed and the condition is tested again. If the condition returns false, execution stops and control is passed to the statement following while."),
            Content(type: .paragraph, text: "To execute multiple statements, use a block statement ({ ... }) to group those statements."),
            Content(type: .paragraph, text: "Example:"),
            Content(type: .paragraph, text: "The following while loop iterates as long as n is less than three:"),
            Content(type: .code, text: "var n = 0; var x = 0; while (n < 3) { n++; x += n; }"),
            Content(type: .paragraph, text: "With each iteration, the loop increments n and adds that value to x. Therefore, x and n take on the following values:"),
            Content(type: .bullet, text: "After the first pass: n = 1 and x = 1"),
            Content(type: .bullet, text: "After the second pass: n = 2 and x = 3"),
            Content(type: .bullet, text: "After the third pass: n = 3 and x = 6"),
            Content(type: .paragraph, text: "After completing the third pass, the condition n < 3 is no longer true, so the loop terminates."),
        ]
        ),
        Topic(title: "Function declarations", contents: [
            Content(type: .paragraph, text: "A function definition (also called a function declaration, or function statement) consists of the function keyword, followed by:"),
            Content(type: .bullet, text: "The name of the function."),
            Content(type: .bullet, text: "A list of arguments to the function, enclosed in parentheses and separated by commas."),
            Content(type: .bullet, text: "The JavaScript statements that define the function, enclosed in curly brackets, { }."),
            Content(type: .paragraph, text: "For example, the following code defines a simple function named square:"),
            Content(type: .code, text: """
                function square(number) {
                    return number * number;
                }
                """),
            Content(type: .paragraph, text: "The function square takes one argument, called number. The function consists of one statement that says to return the argument of the function (that is, number) multiplied by itself. The return statement specifies the value returned by the function."),
            Content(type: .code, text: "return number * number;"),
            Content(type: .paragraph, text: "Primitive parameters (such as a number) are passed to functions by value; the value is passed to the function, but if the function changes the value of the parameter, this change is not reflected globally or in the calling function."),
        ]
        ),
    ]
    
    
    static let contentsExample = [
        Content(type: .paragraph, text: "JavaScript is a cross-platform, object-oriented scripting language. It is a small and lightweight language. Inside a host environment (for example, a web browser), JavaScript can be connected to the objects of its environment to provide programmatic control over them."),
      Content(type: .paragraph, text: "JavaScript contains a standard library of objects, such as Array, Date, and Math, and a core set of language elements such as operators, control structures, and statements. Core JavaScript can be extended for a variety of purposes by supplementing it with additional objects; for example:"),
      Content(type: .bullet, text: "Client-side JavaScript extends the core language by supplying objects to control a browser and its Document Object Model (DOM). For example, client-side extensions allow an application to place elements on an HTML form and respond to user events such as mouse clicks, form input, and page navigation."),
      Content(type: .bullet, text: "Server-side JavaScript extends the core language by supplying objects relevant to running JavaScript on a server. For example, server-side extensions allow an application to communicate with a database, provide continuity of information from one invocation to another of the application, or perform file manipulations on a server."),
    ]
}
