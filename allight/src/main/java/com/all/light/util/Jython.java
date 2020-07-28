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
import org.tensorflow.SavedModelBundle;
import org.tensorflow.Session;
import org.tensorflow.Tensor;
import org.tensorflow.TensorFlow;

public class Jython {

	public static void main(String[] args) throws IOException {
		 Properties props = new Properties();
	     props.put("python.home", "path to the Lib folder");
	     props.put("python.console.encoding", "UTF-8");
	     props.put("python.security.respectJavaAccessibility", "false");
	     props.put("python.import.site", "false");
	     Properties preprops = System.getProperties();
	     PythonInterpreter.initialize(preprops, props, new String[0]);
	 
	     /*String path = ResourceUtils.getFile("d:\\study\\pj5ML\\login.py").getPath();
	     PythonInterpreter interpreter = new PythonInterpreter();
	     interpreter.execfile(path);
	     PyFunction function = interpreter.get("my_test",PyFunction.class);
	     PyObject pyobject = function.__call__(new PyString("huzhiwei"),new PyString("25"));
	     System.out.println("anwser = " + pyobject.toString());*/
	     	     
	     float[][] value=new float[784][10];
	     
	     System.out.println(TensorFlow.version());  
	     SavedModelBundle b=SavedModelBundle.load("d:\\study\\pj5ML\\logintf", "serve");
	     Session sess=b.session();
	     Tensor x=Tensor.create(value);
	     float[][] y= sess.runner().feed("x", x).fetch("h").run().get(0).copyTo(new float[784][10]);
	     
	     for(int i=0;i<y.length;i++)
	    	 System.out.println(y[i][0]);
	}

}
