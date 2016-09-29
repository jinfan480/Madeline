package com.madeline.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.madeline.entity.Artefact;
import com.madeline.service.ArtefactService;

public class ArtefactAction {

	private Artefact artefact;
	private ArtefactService artefactService;

	private HttpServletRequest request;

	 private File file;
	    
	    //提交过来的file的名字
	    private String fileFileName;
	    
	    //提交过来的file的MIME类型
	    private String fileContentType;

	    public File getFile()
	    {
	        return file;
	    }

	    public void setFile(File file)
	    {
	        this.file = file;
	    }

	    public String getFileFileName()
	    {
	        return fileFileName;
	    }

	    public void setFileFileName(String fileFileName)
	    {
	        this.fileFileName = fileFileName;
	    }

	    public String getFileContentType()
	    {
	        return fileContentType;
	    }

	    public void setFileContentType(String fileContentType)
	    {
	        this.fileContentType = fileContentType;
	    }
	
	public Artefact getArtefact() {
		return artefact;
	}

	public void setArtefact(Artefact artefact) {
		this.artefact = artefact;
	}

	public ArtefactService getArtefactService() {
		return artefactService;
	}

	public void setArtefactService(ArtefactService artefactService) {
		this.artefactService = artefactService;
	}

	public String artefactAdd() {
		artefact.setIsdeleted(false);
		return artefactService.addArtefact(artefact);
	}

	public String artefactDelete() {
		return artefactService.deleteArtefact(artefact);
	}

	public String artefactModify() {
		return artefactService.modifyArtefact(artefact);
	}

	public String artefactUpload() throws IOException {
//		String root = ServletActionContext.getServletContext().getRealPath("/upload");
		String root = "D:/";
		InputStream is = new FileInputStream(file);
		OutputStream os = new FileOutputStream(new File(root, fileFileName));
		System.out.println("fileFileName: " + fileFileName);
		// 因为file是存放在临时文件夹的文件，我们可以将其文件名和文件路径打印出来，看和之前的fileFileName是否相同
		System.out.println("file: " + file.getName());
		System.out.println("file: " + file.getPath());

		byte[] buffer = new byte[500];
		int length = 0;

		while (-1 != (length = is.read(buffer, 0, buffer.length))) {
			os.write(buffer);
		}
		os.close();
		is.close();
		return "success";
	}
}
