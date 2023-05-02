package it.prova.raccoltafilm.web.servlet.utente;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.prova.raccoltafilm.service.MyServiceFactory;
import it.prova.raccoltafilm.service.RuoloService;

@WebServlet("/admin/PrepareInsertUtenteServlet")
public class PrepareInsertUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	private RuoloService ruoloService;
	
	
	public PrepareInsertUtenteServlet() {
		this.ruoloService = MyServiceFactory.getRuoloServiceInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			request.setAttribute("ruoli_list_attr", ruoloService.listAll());
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage","Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/home").forward(request, response);
		}
		request.getRequestDispatcher("/utente/insert.jsp").forward(request, response);
	}



}
