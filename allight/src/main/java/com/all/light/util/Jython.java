package com.all.light.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import org.python.core.PyFunction;
import org.python.core.PyInteger;
import org.python.core.PyObject;
import org.python.core.PyString;
import org.python.util.PythonInterpreter;
import org.springframework.util.ResourceUtils;

public class Jython {

	public static void main(String[] args) throws IOException {
		 Properties props = new Properties();
	     props.put("python.home", "path to the Lib folder");
	     props.put("python.console.encoding", "UTF-8");
	     props.put("python.security.respectJavaAccessibility", "false");
	     props.put("python.import.site", "false");
	     Properties preprops = System.getProperties();
	     PythonInterpreter.initialize(preprops, props, new String[0]);
	 
	     String path = ResourceUtils.getFile("d:\\study\\pj5ML\\login.py").getPath();
	     PythonInterpreter interpreter = new PythonInterpreter();
	     interpreter.execfile(path);
	     PyFunction function = interpreter.get("my_test",PyFunction.class);
	     PyObject pyobject = function.__call__(new PyString("huzhiwei"),new PyString("25"));
	     System.out.println("anwser = " + pyobject.toString());
	     
	     PythonInterpreter interp = new PythonInterpreter();
	     
	        System.out.println("3");
	        
	        // The exec() method executes strings of code
	        interp.exec("print sys");

	        // Set variable values within the PythonInterpreter instance
	        interp.set("a", new PyInteger(42));
	        interp.exec("print a");
	        interp.exec("x = 2+2");

	        // Obtain the value of an object from the PythonInterpreter and store it
	        // into a PyObject.
	        PyObject x = interp.get("x");
	        System.out.println("x: " + x);
	}

}
