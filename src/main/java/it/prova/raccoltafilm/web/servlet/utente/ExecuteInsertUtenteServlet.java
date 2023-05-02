package it.prova.raccoltafilm.web.servlet.utente;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.prova.raccoltafilm.model.Ruolo;
import it.prova.raccoltafilm.model.Utente;
import it.prova.raccoltafilm.service.MyServiceFactory;
import it.prova.raccoltafilm.service.RuoloService;
import it.prova.raccoltafilm.service.UtenteService;
import it.prova.raccoltafilm.utility.UtilityForm;

@WebServlet("/admin/ExecuteInsertUtenteServlet")
public class ExecuteInsertUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UtenteService utenteService;
	RuoloService ruoloService;

	public ExecuteInsertUtenteServlet() {
		this.utenteService = MyServiceFactory.getUtenteServiceInstance();
		this.ruoloService = MyServiceFactory.getRuoloServiceInstance();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nomeParam = request.getParameter("nome");
		String cognomeParam = request.getParameter("cognome");
		String usernameParam = request.getParameter("username");
		String passwordParam = request.getParameter("password");
		String confermaPasswordParam = request.getParameter("conferma_password");

		String[] ruoliIds = request.getParameterValues("ruolo");
		Set<Ruolo> ruoli = new HashSet<>();
		if (ruoliIds != null) {
			for (String ruoloId : ruoliIds) {
				try {
					Long id = Long.parseLong(ruoloId);
					Ruolo ruoloDaAggiungere = ruoloService.caricaSingoloElemento(id);
					ruoli.add(ruoloDaAggiungere);
				} catch (NumberFormatException e) {
					// Ignoriamo gli id dei ruoli non validi
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		Utente utenteInstance = UtilityForm.createUtenteNewFromParams(usernameParam, passwordParam, nomeParam,
				cognomeParam);

		utenteInstance.setRuoli(ruoli);
		

		if (!UtilityForm.validateUtenteBean(utenteInstance)) {
			request.setAttribute("insert_utente_attr", utenteInstance);
			try {
				request.setAttribute("ruoli_list_attr", ruoloService.listAll());
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("errorMessage", "Attenzione sono presenti errori di validazione");
			request.getRequestDispatcher("/utente/insert.jsp").forward(request, response);
			return;
		}
		if (!passwordParam.equals(confermaPasswordParam)) {
			request.setAttribute("insert_utente_attr", utenteInstance);
			try {
				request.setAttribute("ruoli_list_attr", ruoloService.listAll());
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("errorMessage", "Attenzione! Le password non corrispondono.");
			request.getRequestDispatcher("/utente/insert.jsp").forward(request, response);
			return;
		}

		try {
			utenteService.inserisciNuovo(utenteInstance);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione! Si è verificato un problema.");
			request.getRequestDispatcher("/utente/insert.jsp").forward(request, response);
			return;
		}

		response.sendRedirect(request.getContextPath() +"/admin/ExecuteListUtenteServlet?operationResult=SUCCESS");
	}

}
