package com.kamazoun.service;

import java.io.FileNotFoundException;
import java.util.Scanner;

import javax.swing.JApplet;
import javax.swing.JFileChooser;

public class FileChooser extends JApplet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	public FileChooser()
	{
		// TODO Auto-generated constructor stub
		JFileChooser fileChooser = new JFileChooser("C:/Users/kamazoun/workpace EE/kamaz web commerce platform/WebContent/images");
	    if (fileChooser.showOpenDialog(null)
	        == JFileChooser.APPROVE_OPTION) {
	      // Get the selected file
	      java.io.File file = fileChooser.getSelectedFile();
	    }
	     //peut etre vaudrait il mieux utiliser javascript filechooser.
	}
}
