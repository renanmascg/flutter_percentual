PercentualPerfil perfilConservador = PercentualPerfil(
  namePerfil: 'Conservador',
  fundoRendaFixa: 0.3,
  ativoRendaFixa: 0.45,
  fundoMultimercado: 0.1,
  fundoAcoes: 0.1,
  fundoImobiliario: 0.0,
  prevPrivada: 0.05,
);

PercentualPerfil perfilModerado = PercentualPerfil(
  namePerfil: 'Moderado',
  fundoRendaFixa: 0.1,
  ativoRendaFixa: 0.30,
  fundoMultimercado: 0.15,
  fundoAcoes: 0.30,
  fundoImobiliario: 0.10,
  prevPrivada: 0.05,
);

PercentualPerfil perfilArrojado = PercentualPerfil(
  namePerfil: 'Arrojado',
  fundoRendaFixa: 0.1,
  ativoRendaFixa: 0.20,
  fundoMultimercado: 0.10,
  fundoAcoes: 0.40,
  fundoImobiliario: 0.15,
  prevPrivada: 0.05,
);

PercentualPerfil perfilAgressivo = PercentualPerfil(
  namePerfil: 'Agressivo',
  fundoRendaFixa: 0.0,
  ativoRendaFixa: 0.10,
  fundoMultimercado: 0.10,
  fundoAcoes: 0.60,
  fundoImobiliario: 0.15,
  prevPrivada: 0.05,
);

class ProfileCalculator {
  double percFundoRendaFixa;
  double percAtivoRendaFixa;
  double percFundoMultimercado;
  double percFundoImobiliario;
  double percAcoes;
  double percPrevidPrivada;

  final List<PercentualPerfil> _perfis = [
    perfilConservador,
    perfilModerado,
    perfilArrojado,
    perfilAgressivo
  ];

  ProfileCalculator({
    this.percFundoRendaFixa,
    this.percAtivoRendaFixa,
    this.percAcoes,
    this.percPrevidPrivada,
    this.percFundoMultimercado,
    this.percFundoImobiliario,
  });

  String generatePerfil() {
    String perfil = _perfis[0].namePerfil;
    double erro = _calculatePerfil(_perfis[0]);

    _perfis.forEach((perf) {
      final auxErro = _calculatePerfil(perf);

      print('${perf.namePerfil} -> ${auxErro.toString()}');

      if (erro > auxErro) {
        perfil = perf.namePerfil;
        erro = auxErro;
      }
    });

    return perfil;
  }

  double _calculatePerfil(PercentualPerfil perfil) {
    double erro = 0.0;
    erro += (percAtivoRendaFixa - perfil.ativoRendaFixa).abs();
    erro += (percFundoRendaFixa - perfil.fundoRendaFixa).abs();
    erro += (percAcoes - perfil.fundoAcoes).abs();
    erro += (percFundoMultimercado - perfil.fundoMultimercado).abs();
    erro += (percFundoImobiliario - perfil.fundoImobiliario).abs();
    erro += (percPrevidPrivada - perfil.prevPrivada).abs();

    return erro;
  }
}

class PercentualPerfil {
  final String namePerfil;
  final double ativoRendaFixa;
  final double fundoRendaFixa;
  final double fundoMultimercado;
  final double fundoAcoes;
  final double fundoImobiliario;
  final double prevPrivada;

  PercentualPerfil({
    this.namePerfil,
    this.ativoRendaFixa,
    this.fundoRendaFixa,
    this.fundoMultimercado,
    this.fundoAcoes,
    this.fundoImobiliario,
    this.prevPrivada,
  });
}
