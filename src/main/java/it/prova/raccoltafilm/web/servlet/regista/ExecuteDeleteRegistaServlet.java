package it.prova.raccoltafilm.web.servlet.regista;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;

import it.prova.raccoltafilm.exceptions.RegistaConFilm;
import it.prova.raccoltafilm.service.MyServiceFactory;
import it.prova.raccoltafilm.service.RegistaService;

@WebServlet("/admin/ExecuteDeleteRegistaServlet")
public class ExecuteDeleteRegistaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private RegistaService registaService;

	public ExecuteDeleteRegistaServlet() {
		this.registaService = MyServiceFactory.getRegistaServiceInstance();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idRegistaParam = request.getParameter("idRegista");
		if (!NumberUtils.isCreatable(idRegistaParam)) {
			response.sendRedirect(request.getContextPath() + "/home?operationResult=ERROR");
			return;
		}
		Long idregista = Long.parseLong(idRegistaParam);
		try {

			registaService.rimuovi(idregista);
		} catch (RegistaConFilm ex) {
			response.sendRedirect(request.getContextPath() + "/ExecuteListRegistaServlet?operationResult=ERROR_FILM_ESISTENTI");
			return;
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/home?operationResult=ERROR");
			return;
		}

		response.sendRedirect(request.getContextPath() +"/ExecuteListRegistaServlet?operationResult=SUCCESS");
	}

}
