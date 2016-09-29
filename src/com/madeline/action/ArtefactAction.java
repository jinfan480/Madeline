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
	    
	    //�ύ������file������
	    private String fileFileName;
	    
	    //�ύ������file��MIME����
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
		// ��Ϊfile�Ǵ������ʱ�ļ��е��ļ������ǿ��Խ����ļ������ļ�·����ӡ����������֮ǰ��fileFileName�Ƿ���ͬ
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
